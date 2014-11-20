# environment {{{
export EDITOR="vim"
export PAGER="less"
export BROWSER="chromium"
export MOVPLAY="mplayer"
export PICVIEW="feh"
export SNDPLAY="mplayer"
export TERMINAL="urxvt"

export DROPBOX_HOME="$HOME/Dropbox"
export ARCH_HOME="/opt/github/jkoz/home"
export PROJECT="$HOME/data/projects"
export CATALINA_HOME="${PROJECT}/apache-tomcat-8.0.5/"
export AXS_HOME="${PROJECT}/axs"
export MEDIA_HOME="$HOME/media"
export VIDEO_HOME="$MEDIA_HOME/video"
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_TEMPLATES_DIR="$HOME/.Templates"
XDG_VIDEOS_DIR="$HOME/Videos"
PATH="/home/tait/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/tait/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tait/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tait/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tait/perl5"; export PERL_MM_OPT;
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
export MPD_HOST=~/.mpd/socket

PATH=$HOME/bin:${PATH}

# history
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history
# }}}

# options {{{
setopt AUTO_CD                      # Automatically cd in to directories if it's not a command name.
setopt AUTO_PUSHD                   # Automatically push visited directories to the stack.
setopt PUSHD_IGNORE_DUPS            # ...and don't duplicate them.

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

autoload -U compinit; compinit  # advance tab complete
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

#bindkey '^b' backward-word
#bindkey '^w' forward-word
#bindkey '^h' backward-char
#bindkey '^l' forward-char

#bindkey '^g' beginning-of-line
#bindkey '^e' end-of-line
# }}}

# prompt {{{
if [ $(tput colors) = 256 ]; then
    local p="%{$FX[reset]$FG[255]%}"

    local name="%{$FX[reset]$FG[117]%}%n"
    local host="%{$FX[reset]$FG[177]%}%m"
    local jobs="%1(j.(%{$FX[reset]$FG[197]%}%j job%2(j.s.)${p})-.)"
    local time="%{$FX[reset]$FG[180]%}%D{%H:%M}"
    local dir="%{$FX[reset]$FG[199]%}%~"

    local last="%(?..%{$FX[reset]$FG[203]%}%??${p}:)"
    local hist="%{$FX[reset]$FG[220]%}%!!"
    local priv="%{$FX[reset]$FG[245]%}%#"
    #git_status=git_super_status

    PROMPT="${time}${p} ${name}${p}@${host}${p}${jobs}${p}:${dir}${p}\${git_status}${p} %(!.#.$) "
else
    autoload colors zsh/terminfo
    [[ "$terminfo[colors]" -ge 8 ]] && colors

    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    #   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        eval PR_$color='%{$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"
    PS1="%(#~$PR_RED~$PR_CYAN)%n$PR_WHITE@$PR_MAGENTA%m$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR %(!.#.$)$b % "
    RPS1="$FG[214]$PR_YELLOW%D{%H:%M}$PR_NO_COLOR"
fi
# }}}

# completion {{{
autoload -Uz compinit && compinit

zstyle ':completion:*' list-colors "${LS_COLORS}" # Complete with same colors as ls.

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _expand _complete _correct _approximate # Completion modifiers.
zstyle ':completion:*:match:*' original only
zstyle ':completion:*' max-errors 1 # Be lenient to 1 errors.

# And if you want the number of errors allowed by _approximate to increase with the length of what you have typed so far:
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Ignore completion functions for commands you don’t have:
zstyle ':completion:*:functions' ignored-patterns '_*'

# Ignore the current directory in completions
zstyle ':completion:*' ignore-parents pwd

# Use a completion cache
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path /.zsh/cache

# Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# If you end up using a directory as argument, this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# Sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*' menu select
# }}}

# zsh opt {{{ # jobs background will not be kill if exit its session
setopt NO_HUP
unsetopt HUP

# Use modern completion system

# Map Ctrl-S to sth usefull other than XOFF (interrupt data flow).
stty -ixon
# }}}

# functions {{{
tV() { cd ${VIDEO_HOME}; rtorrent "$@"; }
#}}}

# alias {{{
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
alias ll='ls -la --color=auto'
alias la='ls -ltra'
alias l='ls --color=auto'
alias C='clear'
alias se='sudo vim'
alias e='vim'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias k='exit'
alias te='trash-empty'
alias tl='trash-list'
alias del='trash-put'
alias tr='trash-rm'
alias lsTrash='ls ~/.local/share/Trash/files/'
alias cdTrash='cd ~/.local/share/Trash/files/'
alias lD='ls ~/Downloads'
alias D='cd ~/Downloads'
alias uD="cd ${ARCH_HOME} && ./INSTALL"
alias mutt='TERM=screen-256color mutt -y'
alias irssi='TERM=screen-256color irssi'
alias b='mvn clean install -Dtest'
alias e='mvn eclipse:clean eclipse:eclipse'
alias eX='vim ${ARCH_HOME}/.Xresources; uD'
alias XTR='xrdb -merge ~/.Xresources'
alias e='vim'
alias eZ='vim ${ARCH_HOME}/zshrc; uD'
alias eI='vim ${ARCH_HOME}/i3/config; uD'
alias eV='vim ${ARCH_HOME}/vimrc; uD'
alias eC='vim ${ARCH_HOME}/outliners/cmd.txt;'
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
# }}}

# environment {{{
export EDITOR="vim"
export PAGER="less"
export BROWSER="chromium"
export MOVPLAY="mplayer"
export PICVIEW="feh"
export SNDPLAY="mplayer"
export TERMINAL="urxvt"

export DROPBOX_HOME="$HOME/Dropbox"
export ARCH_HOME="/opt/github/jkoz/home"
export PROJECT="$HOME/data/projects"
export CATALINA_HOME="${PROJECT}/apache-tomcat-8.0.5/"
export AXS_HOME="${PROJECT}/axs"
export MEDIA_HOME="$HOME/media"
export VIDEO_HOME="$MEDIA_HOME/video"
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_TEMPLATES_DIR="$HOME/.Templates"
XDG_VIDEOS_DIR="$HOME/Videos"
PATH="/home/tait/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/tait/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tait/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tait/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tait/perl5"; export PERL_MM_OPT;
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
export MPD_HOST=~/.mpd/socket

PATH=$HOME/bin:${PATH}
#}}}
