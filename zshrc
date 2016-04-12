# environment {{{
export EDITOR="vim"
export PAGER="less"
export BROWSER="vimb-tabbed"
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
export GEM_HOME=/home/tait/.gem/ruby/2.2.0
export XMODIFIERS=@im=SCIM

export GTK_MODULES=rgba
export GTK_RGBA_APPS="allbut:firefox-bin:gnome-mplayer:totem:soffice:<unknown>:exe"

export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
export MPD_HOST=~/.mpd/socket
export LS_COLORS='no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cc=00;38;5;245:*.sqlite=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:'; #'
PATH=${GEM_HOME}/bin:${PATH}

# history
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history
# }}}
# options {{{
setopt AUTO_CD                      # Automatically cd in to directories if it's not a command name.
setopt AUTO_PUSHD                   # Automatically push visited directories to the stack.
setopt PUSHD_IGNORE_DUPS            # ...and don't duplicate them.

bindkey -v
export KEYTIMEOUT=1                 # 0.1 second to change to normal mode for line editing

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

zle-fd() {
    zle kill-whole-line
    fd
    zle accept-line
}
zle -N zle-fd
bindkey '^e' zle-fd

#bindkey '^b' backward-word
#bindkey '^w' forward-word
#bindkey '^h' backward-char
#bindkey '^l' forward-char

#bindkey '^g' beginning-of-line
#bindkey '^e' end-of-line
# }}}
# prompt {{{

reset_color="%F{white}"
_prompt_git_info() { git rev-parse --abbrev-ref HEAD 2> /dev/null | xargs -r printf '%%F{cyan}[%s] ';  }
_prompt_hg_info() { hg branch 2> /dev/null | xargs -r printf '%%F{blue}[%s] '; }
_prompt() { test -z "$VIM_PROMPT" && echo "%{%F{blue}%}>%{%F{blue}%}>%{%F{red}%}> " || echo "%F{blue}%}<%F{blue}%}<%F{red}%}< "; }

PROMPT="\$(_prompt)%{$reset_color%}"
RPROMPT="\$(_prompt_git_info)\$(_prompt_hg_info)%{$reset_color%}"

function zle-line-init zle-keymap-select {
    VIM_PROMPT="${${KEYMAP/vicmd/ normal }/(main|viins)/}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
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
    alias ll='ls -lah --color=auto'
    alias l='ls --color=auto'
fi
alias dmenu='st -c Fzf -e sh -c'
alias pdf="zathura-tabbed"
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
