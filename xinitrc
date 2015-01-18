# encrypts DNS traffic between the user and a DNS resolver, preventing spying, spoofing or man-in-the-middle attacks.
#dnscrypt-proxy &

xrdb ~/.Xresources # load x resources
xset r rate 300 50 # use faster typing

xset b off # no beep

xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc


setxkbmap -option ctrl:swapcaps # swap caplocks and left ctrl
sxhkd & # bindkey


/usr/bin/urxvtd -q -f -o # terminal daemon
dunst & # desktop notification

# gpg-agent
gpg-agent --daemon --use-standard-socket


xautolock -locker  "slock" -corners 0+00  -cornerdelay 1 & # xautolock

# torrent
transmission-daemon -c ~/Downloads

# use left pointer cursor in all cases
xsetroot -solid "#002b36" -cursor_name left_ptr -name " "

# idesk
idesk &

# composite
#compton -b

# vnc TODO: this block start at the first time, should run as service
#x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg

# Network manager front-end
nm-applet &

# following services are now managed by systemd
dropboxd &

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
#

# Addition monitor
if test $2; then
    # TV configure if any
    # Samsung TV : Menu / Picture / Picture Options / Size / Screen Fit (instead of 16:9)
    # Sharp Aquos : Menu > System Options > View Option > View Mode > Dot by Dot
    # monitors
    xrandr --output HDMI1 --auto --primary --left-of LVDS1
    xrandr --output LVDS1 --off
    #xrandr --output LVDS1 --auto --primary --on
fi


# start with startx ~/.xinitrc bspwm
# Here dwm is kept as default
session=${1:-dwm}

case $session in
    awesome           ) exec awesome;;
    bspwm             ) exec bspwm;;
    catwm             ) exec catwm;;
    cinnamon          ) exec cinnamon-session;;
    dwm               ) dwmstatus & exec dwm;;
    enlightenment     ) exec enlightenment_start;;
    ede               ) exec startede;;
    fluxbox           ) exec startfluxbox;;
    gnome             ) exec gnome-session;;
    gnome-classic     ) exec gnome-session --session=gnome-classic;;
    i3|i3wm           ) exec i3;;
    icewm             ) exec icewm-session;;
    jwm               ) exec jwm;;
    kde               ) exec startkde;;
    mate              ) exec mate-session;;
    monster|monsterwm ) exec monsterwm;;
    notion            ) exec notion;;
    openbox           ) exec openbox-session;;
    unity             ) exec unity;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad            ) exec xmonad;;
    # No known session, try to run it as command
    *) exec $1;;
esac
