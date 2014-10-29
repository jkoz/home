# useage fetchmailrc_tptai_at_tma_com_vn | fetchmailrc -k -f -
fetchmailrc_tptai_at_tma_com_vn () {
    stty -echo
    read pw
    stty echo
    config="\n"
    config="${config}set daemon 60\n"
    config="${config}set logfile /dev/null\n"
    config="${config}set no bouncemail\n"
    config="${config}poll pop3.tma.com.vn proto POP3\n"
    config="${config}user tptai pass ${pw} is ${USER} options ssl preconnect \"date\"\n"
    config="${config}mda \"/usr/bin/procmail -d %T\"\n"
    echo $config
}

function tmux-main() { #{{{1
    tmux_session_name=$USER

    tmux start-server
    tmux new-session -d -s $tmux_session_name

    tmux new-window -t $tmux_session_name:1 -n mutt
    tmux send-keys -t $tmux_session_name:1 "mutt" C-m

    tmux new-window -t $tmux_session_name:2 -n irssi
    tmux send-keys -t $tmux_session_name:2.0 "irssi" C-m

    tmux select-window -t $tmux_session_name:1
    tmux attach-session -t $tmux_session_name
} #1}}}
