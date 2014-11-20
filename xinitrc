# encrypts DNS traffic between the user and a DNS resolver, preventing spying, spoofing or man-in-the-middle attacks.
#dnscrypt-proxy &

# load x resources
xrdb ~/.Xresources

# use faster typing
xset r rate 300 50

# no beep
xset b off

# fonts
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local

# swap caplocks and left ctrl
setxkbmap -option ctrl:swapcaps

sxhkd &

# start urxvtd
/usr/bin/urxvtd -q -f -o

# desktop notification
dunst &

# wall paper
feh --bg-scale ~/Dropbox/arch/tait/media/images/wallpapers/debian-7271-1680x1050.jpg &

# xautolock
xautolock -locker  "xlock -mode blank" -corners 0+00  -cornerdelay 1 &

# TV configure if any
# Samsung TV : Menu / Picture / Picture Options / Size / Screen Fit (instead of 16:9)
# Sharp Aquos : Menu > System Options > View Option > View Mode > Dot by Dot

# monitors
xrandr --output HDMI1 --auto --primary --left-of LVDS1
xrandr --output LVDS1 --off
#xrandr --output LVDS1 --auto --primary --on


# use left pointer cursor in all cases
xsetroot -solid "#002b36" -cursor_name left_ptr -name " "

# composite
compton -b

# vnc TODO: this block start at the first time, should run as service
#x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg

# following services are now managed by systemd
# dropboxd &   # TODO: need test
# fetchmail

# auto mount usb
#udiskie &
#
# Redshift - changed screen colour temp
# redshift-gtk -l 55.978301:-3.228586 -t 6000:4500 &
#
# Volume system tray
# pa-applet &
# volti &
#
# # Radio streams
# radiotray &
#
# copy /past handler
# autocutsel -fork &
#
# Unclutter - hides the mouse cursor after 5 seconds of idle
# unclutter -root -jitter 10 &

# wm
exec bspwm
