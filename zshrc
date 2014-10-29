# zsh opt {{{
setopt histignorealldups sharehistory
# jobs background will not be kill if exit its session
setopt NO_HUP
unsetopt HUP

# Use modern completion system
autoload -Uz compinit
compinit

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
# Map Ctrl-S to sth usefull other than XOFF (interrupt data flow).
stty -ixon
# }}}
# zsh bindkey {{{
bindkey -v
bindkey ^R history-incremental-pattern-search-backward
bindkey ^S history-incremental-pattern-search-forward
# scroll history with C-k & C-j
bindkey '^k'    up-line-or-history
bindkey '^j'    down-line-or-history
# }}}
# zstyle {{{
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# }}}
# window manager opt {{{
export WM_FONT="Inconsolata:size=11"
export WM_NORM_FG_COLOR="#696969"
export WM_NORM_BG_COLOR="#121212"
export WM_SEL_FG_COLOR="#E0E0E0"
export WM_SEL_BG_COLOR="#121212"
# arch linux
ZSH=/usr/share/oh-my-zsh
if test "$UID" -eq 0
then
    plugins=(git jira vi-mode svn safe-paste)
    ZSH_THEME="imajes"
else
    plugins=(autoenv git jira vi-mode svn safe-paste)
    ZSH_THEME="gallois"
fi
source $ZSH/oh-my-zsh.sh
# }}}
# Default Programs {{{
export EDITOR="vim"
export PAGER="less"
export BROWSER="chromium"
export MOVPLAY="mplayer"
export PICVIEW="feh"
export SNDPLAY="mplayer"
export TERMINAL="urxvt"
# }}}
# projects {{{
export DROPBOX_HOME="$HOME/Dropbox/arch/${USER}"
export PROJECT="$HOME/data/projects"
export CATALINA_HOME="${PROJECT}/apache-tomcat-8.0.5/"
export AXS_HOME="${PROJECT}/axs"
export MEDIA_HOME="$HOME/media"
export VIDEO_HOME="$MEDIA_HOME/video"
# }}}
# auto cd {{{
autoenv_cd () {
    builtin cd $@

    if test "`pwd`" = "${AXS_HOME}" -a x"${axs_home_reload}" = x ; then
        #echo "loading env for axs..."
        # init axs plugins/theme
        plugins=(ams autoenv git jira vi-mode svn safe-paste)
        ZSH_THEME="ams"

        # reload it
        reload_zsh_plugin

        # before reload use in ams plugin
        before_autoenv_cd

        # mark it, avoid load again
        axs_home_reload=1
    fi
}

# overide in oh-my-zsh plugin
before_autoenv_cd() {
}
# }}}
# scim {{{
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
# }}}
# man pages colors {{{
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
# }}}
## aliases
# browser {{{
if test -f /etc/debian_versionetc; then
    alias chromium='chromium-browser'
fi
# }}}
# projects {{{
alias pA='cd $AXS_HOME'
# }}}
# torrent {{{
tV() { cd ${VIDEO_HOME}; rtorrent "$@"; }
# }}}
# packages {{{
alias extract='dtrx'
alias gz='tar -xzf'
alias xz='tar -xJf'
alias bz='tar -xvjf'
# }}}
# pacman {{{
alias UU='packer-color -Syyu'
alias UUA='yaourt -Syyua --devel'
alias P='packer-color'
alias PI='packer-color -S'
alias Y='yaourt'
alias pac='sudo pacman -S'
alias pac-r='sudo pacman -R'
alias Log='tail -f /var/log/pacman.log'
# }}}
# System {{{
alias shutdown='sudo shutdown -P now'
alias Stat='uname -a;systemd-analyze time;wc -l /lib/modules/$(uname -r)/modules.order;lsinitcpio -a /boot/initramfs-linux.img'
alias laptop-mode='grep -r '^\(CONTROL\|ENABLE\)_' /etc/laptop-mode/conf.d'
alias keys='xev'
alias bub='say en beau is a bunkace'
alias unblock-wireless='rfkill unblock all && ifconfig set wlp3s0 up'
# }}}
# Directories {{{
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
# }}}
# update dotfile {{{
alias uD="cd ${DROPBOX_HOME} && ./INSTALL"
# }}}
# mutt {{{
alias mutt='TERM=screen-256color mutt -y'
# }}}
# IRC {{{
alias irssi='TERM=screen-256color irssi'
# }}}
# maven {{{
alias b='mvn clean install -Dtest'
alias e='mvn eclipse:clean eclipse:eclipse'
# }}}
# X Resources Stuff {{{
alias eX='vim ${DROPBOX_HOME}/.Xresources; uD'
alias XTR='xrdb -merge ~/.Xresources'
# }}}
# Quick edit {{{
alias e='vim'
alias eZ='vim ${DROPBOX_HOME}/zshrc; uD'
alias eI='vim ${DROPBOX_HOME}/i3/config; uD'
alias eV='vim ${DROPBOX_HOME}/vimrc; uD'
alias eC='vim ${DROPBOX_HOME}/outliners/cmd.txt;'
# }}}
# rip CDs {{{
alias CDinfo='cdparanoia -vsQ'
alias rip='cdparanoia -B'
alias mp3='for t in track{01-14}*.wav; do lame -b 320 $t; done'
# }}}
# News and Music {{{
alias MP='ncmpcpp'
alias news='newsbeuter'
alias nix='cortex linux'
alias pods='podbeuter'
alias twit='turses'
# }}}
# Multimedia {{{
alias irc='weechat-curses'
alias M='mplayer -vo x11 -fs -zoom'
alias Vids='cd ~/Downloads/.blackbox && ranger'
# }}}
# Google Calenar {{{
alias gcal-week='gcalcli --width 12 calw'
alias gcal='gcalcli --width 12 calm'
alias gcal-add='gcalcli quick'
alias gcal-agenda='gcalcli agenda'
# }}}
## function
256colors() {
    for code in {0..255}; do echo -e "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"; done
}
# kill process {{{
dkill () {
    ps -ef | dmenu -l 10 | awk '{print $2}' | xargs kill -9 &>/dev/null
}
# }}}
# dictionary {{{
#dict() {
    #sdcv -u "Cambridge Advanced Learner's Dictionary" -u"Merriam-Webster Collegiate Dictionary" --utf8-output $1 | sed 's/yle=/style=/' | elinks -dump | sed -r 's!(.*). -->(.*)!\2!' | sed -r 's!(.*)>(.*)!\2!' | vim -
#}
# }}}
# auto load oh-my-zsh plugin {{{
is_plugin() {
    local base_dir=$1
    local name=$2
    test -f $base_dir/plugins/$name/$name.plugin.zsh \
        || test -f $base_dir/plugins/$name/_$name
}
reload_zsh_plugin() {
    #echo "Reload zsh plugin"
    # Load and run compinit
    autoload -U compinit
    compinit -i

    # Add all defined plugins to fpath. This must be done before running compinit.
    for plugin ($plugins); do
        if is_plugin $ZSH_CUSTOM $plugin; then
            fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
        elif is_plugin $ZSH $plugin; then
            fpath=($ZSH/plugins/$plugin $fpath)
        fi
    done

    # Two lines here I think we can disregard
    # Load all of the plugins that were defined in ~/.zshrc
    for plugin ($plugins); do
        if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
        elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH/plugins/$plugin/$plugin.plugin.zsh
        fi
    done

    source $ZSH/themes/${ZSH_THEME}.zsh-theme
}
# }}}
# scribd {{{
scribd () {
    url=$1
    ak=`wget -q -O- $url | grep  access_key  | sed -e 's/\(.*\)key-\(.*\)\"/\2/' | cut -d'"' -f1 | \
    xargs echo "key-" | sed 's/ //g'` && docid=`echo $url | cut -d'/' -f5` && \ 
    chromium-browser "http://d1.scribdassets.com/ScribdViewer.swf?document_id=${docid}&access_key=${ak}"
}
# }}}
getwindowinfo () {
    xprop  | grep "WM_CLASS\|WM_NAME(STRING)" | sort | sed -e 's/WM_CLASS(STRING)/instance, class/; s/WM_NAME(STRING)/title/'
}
#perl
PATH="/home/tait/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/tait/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tait/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tait/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tait/perl5"; export PERL_MM_OPT;
