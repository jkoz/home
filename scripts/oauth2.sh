#!/bin/bash

user=""
mail_feed=""
curl_imap=""
_init="_init_google"

_init_google() {
    grant_type="authorization_code"
    xoauth_file="$HOME/.xoauthrc"
    oauth2_uri="https://accounts.google.com/o/oauth2"
    scope="https://mail.google.com%20https://docs.google.com/feeds"
    response_type="code"
    redirect_uri="urn:ietf:wg:oauth:2.0:oob"
    client_id="1018775360540-t32eeesq21aja3kguseudqkkm8b593fn.apps.googleusercontent.com"
    client_secret="OPkwzYTTUK9A-ofGza-5AVx8"
}

_refresh_tokens() {
    eval "$_init";
    if [ -f "$xoauth_file" ]; then
        echo "Found $xoauth_file, try to refresh token"
        refresh_token=`grep refresh_token $xoauth_file | sed -r 's/refresh_token=(.*)/\1/g'`
        response=$(curl -c ~/.surf/cookies.txt --silent "${oauth2_uri}/token" -d "client_id=${client_id}&client_secret=${client_secret}&refresh_token=${refresh_token}&grant_type=refresh_token")
        access_token=`echo $response | python -mjson.tool | grep -oP 'access_token"\s*:\s*"\K(.*)"' | sed 's/"//'`
        refresh_token=`grep refresh_token $xoauth_file | sed -r 's/refresh_token=(.*)/\1/g'`
    else
        echo "Creating new tokens... "
        $BROWSER "${oauth2_uri}/auth?scope=${scope}&response_type=${response_type}&redirect_uri=${redirect_uri}&client_id=${client_id}" |> /dev/null
        printf "Go to browser, copy and paste code here: "; read code
        response=$(curl -s "${oauth2_uri}/token" -d "client_id=${client_id}&&client_secret=${client_secret}&&redirect_uri=${redirect_uri}&&grant_type=${grant_type}&&code=${code}")
        access_token=`echo "$response" | python -mjson.tool | grep -oP 'access_token"\s*:\s*"\K(.*)"' | sed 's/"//'`
        refresh_token=`echo "$response" | python -mjson.tool | grep -oP 'refresh_token"\s*:\s*"\K(.*)"' | sed 's/"//'`
    fi

    echo "[$user]" > $xoauth_file
    echo "access_token=$access_token" >> $xoauth_file
    echo "refresh_token=$refresh_token" >> $xoauth_file
}

_get_mail_feed() {
    response=$(curl -o- -s -H "Authorization: Bearer ${access_token}" "https://mail.google.com/mail/feed/atom");
    if `echo "$response" | grep -q "Unauthorized"`; then
        refresh_access_token
        response=$(curl -o- -s -H "Authorization: Bearer ${access_token}" "https://mail.google.com/mail/feed/atom");
    fi

    echo $response | xmllint --format -
}

_curl_imap() {
    curl -v -s -u "$user" --oauth2-bearer ${access_token} imaps://imap.gmail.com
}

_usage() {
    printf "usage: [--feed] user\n"
}

main() {
    args=$(getopt -q -o f:i -l "feed,curl-imap" -n "$(basename $0)" -- "$@")
    test $? -ne 0 && _usage && exit 1
    eval set -- "$args"; while true; do
        case "$1" in
            -f|--feed) mail_feed="true"; shift ;;
            -i|--curl-imap) curl_imap="true"; shift ;;
            --) shift; break ;;
        esac
    done # $@ will store all remaing args

    test -z "$1" && _usage && exit 1

    user="$1"

    _refresh_tokens $@

    test -n "$mail_feed" && _get_mail_feed
    test -n "$curl_imap" && _curl_imap
}

main $@
