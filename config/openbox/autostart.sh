x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg
feh --bg-scale ~/Downloads/media/wallpapers/wall.jpg &
xlock -mode matrix
xautolock -locker  "xlock -mode blank" -corners 0+00  -cornerdelay 1 &
tint2 -c ~/.config/tint2 &
#scim -d
~/.conky/conkys
#urxvt -e bash -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME" &
urxvtd -q -f -o
urxvt &
fetchmail -vk



#/usr/bin/mail-notification &
#/usr/local/oald8/oald8 &
#thunderbird &
