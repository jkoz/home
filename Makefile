default: mac

all:
	install -Dm600 vimrc ~/.vimrc
	install -Dm600 emacs.d/_init.org ~/.emacs.d/_init.org
	install -Dm600 emacs.d/init.el ~/.emacs.d/init.el
	install -Dm644 ctags ~/.ctags
	install -Dm644 config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
	install -Dm644 config/gtk-2.0/gtkfilechooser.ini ~/.config/gtk-2.0/gtkfilechooser.ini
	install -Dm644 config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
	install -Dm644 gtkrc-2.0 ~/.gtkrc-2.0
	install -Dm644 newsbeuter/config ~/.newsbeuter/config
	install -Dm644 newsbeuter/urls ~/.newsbeuter/urls
	install -Dm644 config/zathura/zathurarc ~/.config/zathura/zathurarc
	install -Dm644 tmux.conf ~/.tmux.conf
	install -Dm644 tmuxinator/cs.yml ~/.tmuxinator/cs.yml
	install -Dm644 local/share/applications/vim.desktop ~/.local/share/applications/vim.desktop
	install -Dm644 local/share/applications/zathura-tabbed.desktop ~/.local/share/applications/zathura-tabbed.desktop
	install -Dm644 dircolors ~/.dircolors
	install -Dm644 zshrc ~/.zshrc
	install -Dm644 bashrc ~/.bashrc
	install -Dm644 bashrc.d/aliases.bash ~/.bashrc.d/aliases.bash
	install -Dm644 bashrc.d/functions.bash ~/.bashrc.d/functions.bash
	#install -Dm644 bashrc.d/fzf.bash ~/.bashrc.d/fzf.bash
	install -Dm644 bashrc.d/gentoo.bash ~/.bashrc.d/gentoo.bash
	install -Dm644 bashrc.d/centos.bash ~/.bashrc.d/centos.bash
	install -Dm644 ncmpcpp/config ~/.ncmpcpp/config
	install -Dm644 mpdconf ~/.mpdconf
	install -Dm644 gdbinit ~/.gdbinit
	install gitconfig ~/.gitconfig
	install -Dm644 mbsyncrc ~/.mbsyncrc
	install -Dm6644 msmtprc ~/.msmtprc
	install -Dm644 mutt/muttrc ~/.mutt/muttrc
	install -Dm644 mailcap ~/.mailcap
	install -Dm644 config/dunst/dunstrc ~/.config/dunst/dunstrc
	#install -Dm644 config/systemd/user/fetchmail.service ~/.config/systemd/user/fetchmail.service
	install -Dm644 config/systemd/user/mpd.service ~/.config/systemd/user/mpd.service
	install -Dm644 config/systemd/user/mpd.socket ~/.config/systemd/user/mpd.socket
	install -Dm644 config/systemd/user/torrent.service ~/.config/systemd/user/torrent.service
	install -Dm644 config/systemd/user/mailagent.service ~/.config/systemd/user/mailagent.service
	install -Dm644 config/systemd/user/mailagent.timer ~/.config/systemd/user/mailagent.timer
	install -Dm644 config/systemd/user/dropbox.service ~/.config/systemd/user/dropbox.service
	install -Dm644 xinitrc ~/.xinitrc
	install -Dm644 Xresources ~/.Xresources
	install -Dm644 xprofile ~/.xprofile
	install -Dm644 irssi/config ~/.irssi/config
	install -Dm644 irssi/startup ~/.irssi/startup
	install -Dm644 irssi/xchat.theme ~/.irssi/xchat.theme
	install -Dm644 irssi/xchatnickcolor.pl ~/.irssi/xchatnickcolor.pl
	install -Dm644 irssi/scripts/adv_windowlist.pl ~/.irssi/scripts/adv_windowlist.pl
	install -Dm644 irssi/scripts/hilightwin.pl ~/.irssi/scripts/hilightwin.pl
	install -Dm644 irssi/scripts/history_search.pl  ~/.irssi/scripts/history_search.pl
	install -Dm644 irssi/scripts/nicklist.pl  ~/.irssi/scripts/nicklist.pl
	install -Dm644 irssi/scripts/notify.pl ~/.irssi/scripts/notify.pl
	install -Dm644 config/ranger/rc.conf ~/.config/ranger/rc.conf
	install -Dm755 config/ranger/scope.sh ~/.config/ranger/scope.sh
	install -Dm644 config/compton.conf ~/.config/compton.conf
	install -Dm644 conkyrc ~/.conkyrc
	install -Dm644 conky/conky_widgets.lua ~/.conky/conky_widgets.lua
	install -Dm644 mplayer/config ~/.mplayer/config
	install -Dm644 ideskrc ~/.ideskrc
	install -Dm644 idesktop/launcher.lnk ~/.idesktop/launcher.lnk
	install -Dm644 idesktop/icons/terminal-32x32.png ~/.idesktop/icons/terminal-32x32.png
	install -Dm644 fonts/ter-x14n.bdf ~/.local/share/fonts/ter-x14n.bdf
	install -Dm644 fonts/xbmicons.bdf ~/.fonts/xbmicons.bdf
	#mkfontscale ~/.fonts
	#mkfontdir ~/.fonts
	install -Dm644 config/vimb/style.css ~/.config/vimb/style.css
	install -Dm644 config/vimb/config ~/.config/vimb/config
	touch ~/.config/vimb/bookmark
	sort -u ~/.config/vimb/bookmark config/vimb/bookmark > /tmp/bookmark
	install -Dm644 /tmp/bookmark  ~/.config/vimb/bookmark
	install -Dm644 /tmp/bookmark  config/vimb/bookmark
	install -Dm644 config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
	chmod +x ~/.config/bspwm/bspwmrc
	install -Dm644 texmf/tex/latex/shading/shading.sty ~/texmf/tex/latex/shading/shading.sty
	install -Dm644 texmf/tex/latex/shading/shading.tex ~/texmf/tex/latex/shading/shading.tex
	#install -Dm644 config/tint2/tint2rc ~/.config/tint2/tint2rc
	install -Dm644 config/Arch.jpg ~/.config/Arch.jpg
	install -Dm644 Xmodmap ~/.Xmodmap
	install -m644 dircolors ~/.dircolors
	install -Dm644 config/tabbed/config.def.h ~/.config/tabbed/config.h
	install -Dm755 scripts/vimb-tabbed ~/bin
	install -Dm755 scripts/zathura-tabbed ~/bin
	install -Dm755 scripts/newpost ~/bin
	install -Dm755 scripts/status ~/bin

ui:
	[ -d ~/.config/surf ] && git -C ~/.config/surf pull || { git clone http://git.suckless.org/surf ~/.config/surf && git -C ~/.config/surf apply ~/home/config/surf/surf-space-search.diff;}
	install -Dm644 config/surf/config.def.h ~/.config/surf/config.def.h
	install -Dm644 surf/script.js ~/.surf/script.js
	[ -d ~/.config/st ] && git -C ~/.config/st pull || git clone http://git.suckless.org/st ~/.config/st
	install -Dm644 config/st/config.def.h ~/.config/st/config.def.h
	[ -d ~/.config/dwm ] && git -C ~/.config/dwm pull || git clone http://git.suckless.org/dwm ~/.config/dwm
	install -Dm644 config/dwm/config.def.h ~/.config/dwm/config.def.h
	[ -d ~/.config/dmenu ] && git -C ~/.config/dmenu pull || git clone http://git.suckless.org/dmenu ~/.config/dmenu
	[ -d ~/.config/tabbed ] && git -C ~/.config/tabbed pull || git clone http://git.suckless.org/tabbed ~/.config/tabbed

apps:
	rm -f ~/.config/config.h && sudo make -C ~/.config/dwm clean install
	rm -f ~/.config/config.h && sudo make -C ~/.config/dmenu clean install
	rm -f ~/.config/config.h && sudo make -C ~/.config/st clean install
	rm -f ~/.config/config.h && sudo make -C ~/.config/tabbed clean install
	rm -f ~/.config/config.h && sudo make -C ~/.config/surf clean install

mac:
	install zshrc ~/.zshrc
	install vimrc ~/.vimrc
	install tmux.conf ~/.tmux.conf
	install fonts/ter-x14n.bdf ~/.fonts
	install fonts/xbmicons.bdf ~/.fonts
	install -m755 scripts/newpost ~/bin/newpost
	install -m755 scripts/256cl ~/bin/256cl
	install -m644 newsbeuter/config ~/.newsbeuter/config
	install -m644 newsbeuter/urls ~/.newsbeuter/urls
