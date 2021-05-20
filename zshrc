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

# java stuff
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home
export M2_HOME=/usr/local/Cellar/maven/3.6.3_1/libexec
export M2=${M2_HOME}/bin
export M2_REPO=$HOME/.m2/repository
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=${M2_HOME}/bin:${JAVA_HOME}/bin:${HOME}/.local/bin:${PATH}

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

# choose ruby environment with: rbenv global 2.7.0
eval "$(rbenv init -)"
export GOPATH="${HOME}/go"
export NEXTWORD_DATA_PATH=$HOME/data/nextword/nextword-data-large

#export GTK_MODULES=rgba
export GTK_RGBA_APPS="allbut:firefox-bin:gnome-mplayer:totem:soffice:<unknown>:exe"

export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

export MPD_HOST=~/.mpd/socket
PATH=${HOME}/bin:${GOPATH}/bin:${PATH}

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

# for the sake of all terminal base programs, undef C-y which suspend the programs
#stty dsusp undef

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fzf {{{
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  #local base02="0"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=40%
    --info=inline
    --multi
    --color fg:-1,bg:-1,gutter:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
    --bind '?:toggle-preview'
    --preview-window=:hidden
    --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
  "
}
_gen_fzf_default_opts

# }}}

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

# prompt and vi-mode {{{
#

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

#_prompt_git_info() { git rev-parse --abbrev-ref HEAD 2> /dev/null | xargs printf '%%F{cyan}[%s] ';  }
#_prompt_hg_info() { hg branch 2> /dev/null | xargs printf '%%F{blue}[%s] '; }
_prompt() { test -z "$VIM_PROMPT" && echo "%F{white}%}> " || echo "%F{cyan}%}< "; }

reset_color="%F{white}"
PROMPT="\$(_prompt)%{$reset_color%}"
#RPROMPT="\$(_prompt_git_info)\$(_prompt_hg_info)%{$reset_color%}"

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

wthr() { curl -s 'wttr.in/Edmonton?format=1'; }
# }}}

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
#alias e='mvn eclipse:clean eclipse:eclipse'
alias XTR='xrdb -merge ~/.Xresources'
alias se='sudo vim'
alias e='vim'
alias m='mutt'
alias t='tmux a'
alias r='rem -n | sort'
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
#alias gcal-week='gcalcli --width 12 calw'
#alias gcal='gcalcli --width 12 calm'
#alias gcal-add='gcalcli quick'
#alias gcal-agenda='gcalcli agenda'
alias c='calcurse'
alias gitone='git --git-dir=.gitone'
alias gittwo='git --git-dir=.gittwo'
# }}}

# sourcing
#source /usr/share/fzf/key-bindings.zsh
#export TERM=xterm-256color-italic
export TERM=xterm-256color
