 encrypts DNS traffic between the user and a DNS resolver, preventing spying, spoofing or man-in-the-middle attacks.
#dnscrypt-proxy &

xrdb ~/.Xresources # load x resources
xset r rate 250 60
xset b off # no beep
xautolock -locker  "slock" -corners 0+00  -cornerdelay 1 & # xautolock
xsetroot -solid "#002b36" -cursor_name left_ptr -name " "

#setxkbmap -option ctrl:swapcaps # swap caplocks and left ctrl
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

# bindkey, combine with dwm config.def.h now
sxhkd &

# Composite
#compton -b

# Feh
feh --bg-scale ~/.config/Arch.jpg

# Desktop notification
#dunst &

# GPG
#gpg-agent --daemon --use-standard-socket

# Torrent
# Move to systemd
#transmission-daemon -c ~/Downloads

# Cloud
#dropbox &

# browser
#google-chrome-stable --no-startup-window &

# move to systemd
redshift &

# Status
#
slstatus -s | lemonbar -f "Terminus-12" -f "FontAwesome-10" -B "#f0073643" -F"#b58900" &
#conky &
#tint2&
#while true; do xsetroot -name "$(acpi | cut -d',' -f2)  $(date +'%b %d %l:%M%p  ')"; sleep 1; done &

#devmon --exec-on-drive "st -c Fzf -e sh -c \"xdotool search 'Fzf' windowsize 100% 50%; dm fm %d\"" &

#xset +fp ~/.fonts
#xset +fp /usr/share/fonts/local
#xset +fp /usr/share/fonts/misc

# VNC
#x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg

# Terminal
#/usr/bin/urxvtd -q -f -o # terminal daemon

# Desktop
#idesk &

# Network
#nm-applet & # Network manager front-end

# Hides the mouse cursor
#unclutter -root -jitter 10 &

# auto mount usb
#udiskie &

# Volume system tray
# pa-applet &

# volti &
# radiotray & # Radio streams
# autocutsel -fork & copy /past handler

# Addition monitor
#if test $2; then
    #xrandr --output HDMI1 --auto --primary --left-of LVDS1
    #xrandr --output LVDS1 --off
    #xrandr --output LVDS1 --auto --primary --on
#fi

#exec wm
exec emacs -mm --debug-init --daemon
