# load x resources
xrdb ~/.Xresources

# use faster typing
xset r rate 300 50

# no beep
xset b off &

# fonts
xset +fp ~/.fonts &
xset +fp /usr/share/fonts/local &

# swap caplocks and left ctrl
setxkbmap -option ctrl:swapcaps &

sxhkd &

# start urxvtd
/usr/bin/urxvtd -q -f -o

# wall paper
feh --bg-scale ~/Dropbox/arch/tait/media/images/wallpapers/debian-7271-1680x1050.jpg &

# xautolock
xautolock -locker  "xlock -mode blank" -corners 0+00  -cornerdelay 1 &

# monitors
xrandr --output HDMI1 --auto --primary --left-of LVDS1
xrandr --output LVDS1 --off
#xrandr --output LVDS1 --auto --primary --on


# use left pointer cursor in all cases
xsetroot -cursor_name left_ptr &

# empty window name
xsetroot -name " " &

# composite
compton -b

# start kuake-liked urxvt
urxvtc -name "scratchpadterm" -pe "kuake,default,matcher" -e "zsh" -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session" &

# i3 use i3bar
# conky
#(conky | dzen2 -fn "Inconsolata:10" -dock -bg "#16171c" ) &

# vnc
x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg

# dropbox
dropboxd &

# window managers
#exec openbox-session
#exec i3
#exec dwm &
exec bspwm
