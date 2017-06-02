#!/bin/bash

#set -x

export HISTCONTROL=ignoreboth:erasedups # no duplicate entries
export PROMPT_COMMAND="history -a" # update histfile after every command
export HISTSIZE=10000
export HISTIGNORE="&:[ ]*:exit"

#export XMODIFIERS=@im=SCIM

export XMODIFIERS="@im=unikey"
export GTK_IM_MODULE="xim"
export QT_IM_MODULE=xim
export BROWSER=/opt/chromium/chrome
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR="vim"


test "$UID" -eq 0 && export PS1="\e[01;31m# \e[0m" || export PS1="$ "

# aliases
alias l='ls --color=auto'
alias ll='ls -lah --color=auto'
alias ..='cd ..'


# svn
export SVN_EDITOR="$EDITOR --nofork";

# projects directory
export PROJ=$HOME/projects

# source files in ~/.bashrc
for file in `find ~/.bashrc.d/ -type f | grep bash$`; do
    . "$file"
done

if [ -z "$DISPLAY" ] && [ "$TTY" = "/dev/tty1" ]; then
    startx
fi
