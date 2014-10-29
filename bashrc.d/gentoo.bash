if [ ! -f /etc/gentoo-release ]; then
    return
fi

alias VirtualBox='for m in vbox{drv,netadp,netflt}; do modprobe $m; done && /opt/bin/VirtualBox'

export LANG=en_US.utf8
export TERM=rxvt-unicode

# Xmodmap
if [ ! -f ~/.Xmodmap ]; then
    echo 'remove Lock = Caps_Lock
          remove Control = Control_L
          keysym Control_L = Caps_Lock
          keysym Caps_Lock = Control_L
          add Lock = Caps_Lock
          add Control = Control_L' > $HOME/.Xmodmap
fi

jkoz () { printf "\033]2;%s\033\\" "$USER"; }

PATH=$PATH:/usr/local/oald8
