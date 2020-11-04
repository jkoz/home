# environment {{{
export EDITOR="vim"
export PAGER="less"
export BROWSER="surf-tabbed"
export MOVPLAY="mplayer"
export PICVIEW="feh"
export SNDPLAY="mplayer"
export TERMINAL="st"

# fix java problem in dwm, used with wmname LG3D set in xinitrc
export _JAVA_AWT_WM_NONREPARENTING=1

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;33;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

#if [ "$TERM" = "linux" ]; then
    #echo -en "\e]PB839496" # S_base00
    #echo -en "\e]PA93a1a1" # S_base01
    #echo -en "\e]P0eee8d5" # S_base02
    #echo -en "\e]P62aa198" # S_cyan
    #echo -en "\e]P8fdf6e3" # S_base03
    #echo -en "\e]P2859900" # S_green
    #echo -en "\e]P5d33682" # S_magenta
    #echo -en "\e]P1dc322f" # S_red
    #echo -en "\e]PC657b83" # S_base0
    #echo -en "\e]PE586e75" # S_base1
    #echo -en "\e]P9cb4b16" # S_orange
    #echo -en "\e]P7073642" # S_base2
    #echo -en "\e]P4268bd2" # S_blue
    #echo -en "\e]P3b58900" # S_yellow
    #echo -en "\e]PF002b36" # S_base3
    #echo -en "\e]PD6c71c4" # S_violet
    #clear # against bg artifacts
#fi

XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_TEMPLATES_DIR="$HOME/.Templates"
XDG_VIDEOS_DIR="$HOME/Videos"

export CLOUD_HOME="$HOME/Dropbox"
export DOTFILES_HOME="$CLOUD_HOME/Dotfiles"
export NOTES_HOME="$CLOUD_HOME/Documents/Notes"

export PROJECT="$HOME/data/projects"
export CATALINA_HOME="${PROJECT}/apache-tomcat-8.0.5/"
export AXS_HOME="${PROJECT}/axs"
export MEDIA_HOME="$HOME/media"
export GEM_HOME=$HOME/.gem/ruby/2.3.0

#export GTK_MODULES=rgba
export GTK_RGBA_APPS="allbut:firefox-bin:gnome-mplayer:totem:soffice:<unknown>:exe"

export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

export MPD_HOST=~/.mpd/socket
PATH=${GEM_HOME}/bin:${PATH}

# history
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history
# }}}

# options {{{
# vim bind
bindkey -v

# History Options
setopt APPEND_HISTORY               # Don't overwrite history.
setopt SHARE_HISTORY                # write history entries directly to the history file, share the current history file between all sessions.
setopt HIST_VERIFY                  # Verify commands that use a history expansion.
setopt EXTENDED_HISTORY             # Remember all sorts of stuff about the history.
setopt HIST_IGNORE_SPACE            # Ignore commands with leading spaces.
setopt HIST_IGNORE_ALL_DUPS         # Ignore all duplicate entries in the history.
setopt HIST_REDUCE_BLANKS           # Tidy up commands before comitting them to history.
setopt RM_STAR_WAIT                 # Wait, and ask if the user is serious when doing rm *
setopt EXTENDED_GLOB                # Give meaning to lots of crazy characters.

# Completion Options
setopt AUTO_LIST                    # Always automatically show a list of ambiguous completions.
setopt COMPLETE_IN_WORD             # Complete items from the beginning to the cursor.
setopt NO_ALWAYS_LAST_PROMPT        # Put prompt beneath potentials
setopt COMPLETEALIASES              # Complete aliased commands
setopt NO_BEEP                      # Never, ever, beep at me.
setopt PROMPT_SUBST                 # Expand parameters within prompts.
setopt LOCAL_OPTIONS                # Options set/unset inside functions, stay within the function.
setopt INTERACTIVE_COMMENTS         # Allow me to comment lines in an interactive shell.
setopt MULTIBYTE
unsetopt FLOW_CONTROL
setopt NO_HUP # jobs background will not be kill if exit its session
unsetopt HUP
stty -ixon # Map Ctrl-S to sth usefull other than XOFF (interrupt data flow).

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

autoload -U promptinit; promptinit;  prompt walters # prompt
autoload -U colors && colors
# }}}

# bindings {{{
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^h' backward-delete-char
bindkey '^d' delete-char
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
# }}}

# prompt {{{

reset_color="%F{white}"
_prompt_git_info() { git rev-parse --abbrev-ref HEAD 2> /dev/null | xargs printf '%%F{cyan}[%s] ';  }
_prompt_hg_info() { hg branch 2> /dev/null | xargs printf '%%F{blue}[%s] '; }
_prompt() { test -z "$VIM_PROMPT" && echo "%F{white}%}> " || echo "%F{cyan}%}< "; }

PROMPT="\$(_prompt)%{$reset_color%}"
RPROMPT="\$(_prompt_git_info)\$(_prompt_hg_info)%{$reset_color%}"

function zle-line-init zle-keymap-select {
    VIM_PROMPT="${${KEYMAP/vicmd/ normal }/(main|viins)/}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
# }}}

# functions {{{

# goc() - quickly build c & run it {{{
goc() {
    # echo "int main() { printf(\"Hello from cmd\"); }" | goc
    c99 -xc - -g -O2 -Wall -I/usr/include -lm -include math.h -include stdio.h -include stdlib.h -o /tmp/a.out; /tmp/a.out;
}
# }}}

# fd() - quick open file in terminal {{{
fd () {
    f="$(pwd)"
    comm=""
    while test -n "$f"; do
        val=$(ls -1la --group-directories-first | tail -n +3 | dmenu -i -l 5)
        if [ $? != 0 ]; then
            unset f
        else
            val=$(echo $val | awk '{$1=$2=$3=$4=$5=$6=$7=$8=""; gsub(/^[ \t]+|[ \t]+$/,""); print}')
            test -d "$val" && { cd $val; f="$(pwd)"; }|| {
                echo "Open $f/$val with: "
                comm="$(dmenu_path | dmenu -l 5) \"$f/$val\""
                unset f
            }
        fi
    done

    test ! -z $comm && tmux new-window "$comm"
}
#}}}

#}}}

# alias {{{
if which exa >/dev/null; then
    alias ls=exa
    alias l='exa -lh'
    alias ll='exa -abghHliS'
else
    alias ll='ls -lah '
    alias l='ls -G'
    alias ls='ls -G'
fi
#alias dmenu='st -c Fzf -e sh -c'
alias d=sdcv
alias pdf=zathura-tabbed
alias bt="transmission-remote"
alias extract='dtrx'
alias gz='tar -xzf'
alias xz='tar -xJf'
alias bz='tar -xvjf'
alias UU='packer-color -Syyu'
alias UUA='yaourt -Syyua --devel'
alias P='packer-color'
alias PI='packer-color -S'
alias Y='yaourt'
alias pac='sudo pacman -S'
alias pac-r='sudo pacman -R'
alias Log='tail -f /var/log/pacman.log'
alias shutdown='sudo shutdown -P now'
alias Stat='uname -a;systemd-analyze time;wc -l /lib/modules/$(uname -r)/modules.order;lsinitcpio -a /boot/initramfs-linux.img'
alias keys='xev'
alias bub='say en beau is a bunkace'
alias unblock-wireless='rfkill unblock all && ifconfig set wlp3s0 up'
alias space='ncdu'
alias space-color='cdu'
alias C='clear'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias k='exit'
alias te='trash-empty'
alias tl='trash-list'
alias del='trash-put'
alias irssi='TERM=screen-256color irssi'
alias b='mvn clean install -Dtest'
alias e='mvn eclipse:clean eclipse:eclipse'
alias XTR='xrdb -merge ~/.Xresources'
alias se='sudo vim'
alias e='vim'
alias eX='vim ${DOTFILES_HOME}/.Xresources; uD'
alias eZ='vim ${DOTFILES_HOME}/zshrc; uD'
alias eI='vim ${DOTFILES_HOME}/i3/config; uD'
alias eV='vim ${DOTFILES_HOME}/vimrc; uD'
alias eC='vim ${DOTFILES_HOME}/outliners/cmd.txt;'
alias CDinfo='cdparanoia -vsQ'
alias rip='cdparanoia -B'
alias mp3='for t in track{01-14}*.wav; do lame -b 320 $t; done'
alias MP='ncmpcpp'
alias news='newsbeuter'
alias nix='cortex linux'
alias pods='podbeuter'
alias twit='turses'
alias irc='weechat-curses'
alias M='mplayer -vo x11 -fs -zoom'
alias Vids='cd ~/Downloads/.blackbox && ranger'
alias gcal-week='gcalcli --width 12 calw'
alias gcal='gcalcli --width 12 calm'
alias gcal-add='gcalcli quick'
alias gcal-agenda='gcalcli agenda'
alias gitone='git --git-dir=.gitone'
alias gittwo='git --git-dir=.gittwo'
# }}}
