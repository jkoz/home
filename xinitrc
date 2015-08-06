 encrypts DNS traffic between the user and a DNS resolver, preventing spying, spoofing or man-in-the-middle attacks.
#dnscrypt-proxy &

xrdb ~/.Xresources # load x resources
xset r rate 250 60
xset b off # no beep
setxkbmap -option ctrl:swapcaps # swap caplocks and left ctrl
xautolock -locker  "slock" -corners 0+00  -cornerdelay 1 & # xautolock
xsetroot -solid "#002b36" -cursor_name left_ptr -name " "
#xsetroot -solid "#002b36" -cursor_name left_ptr -name " " # use left pointer cursor in all cases
sxhkd & # bindkey
compton -b
dunst & # desktop notification
find ~/Dropbox/Pictures -type f | shuf -n1 | xargs feh --bg-fill
gpg-agent --daemon --use-standard-socket
transmission-daemon -c ~/Downloads
dropbox &
google-chrome-stable --no-startup-window &
redshift-gtk &
#status | while read -r line; do echo "%{r}$line      "; done | lemonbar -f "Cousin-11:bold:antialias=true:dpi=96" -B "#75ffffff" -F"#ff000000" &
status | while read -r line; do echo "%{r}$line      "; done | lemonbar -f "Cousin-11:bold:autohint=false:dpi=96" -B "#f0073642" -F"#ffffffff" &
#conky &
devmon --exec-on-drive "st -c Fzf -e sh -c \"xdotool search 'Fzf' windowsize 100% 50%; dm fm %d\"" &

#xset +fp ~/.fonts
#xset +fp /usr/share/fonts/local
#xset +fp /usr/share/fonts/misc
#x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg
#/usr/bin/urxvtd -q -f -o # terminal daemon
#idesk &
#nm-applet & # Network manager front-end
#unclutter -root -jitter 10 & # Hides the mouse cursor
#udiskie & # auto mount usb
# pa-applet & # Volume system tray
# volti &
# radiotray & # Radio streams
# autocutsel -fork & copy /past handler

# Addition monitor
#if test $2; then
    #xrandr --output HDMI1 --auto --primary --left-of LVDS1
    #xrandr --output LVDS1 --off
    #xrandr --output LVDS1 --auto --primary --on
#fi

exec wm
