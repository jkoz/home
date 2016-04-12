all: \
	ctags \
	vm \
	sxhkd \
	gtk \
	news \
	pdf \
	tmux \
	xdg \
	shell \
	mpd \
	gdb \
	git \
	mail \
	notification \
	systemd \
	x \
	irc \
	fm \
	comp \
	conk \
	ply \
	idsk \
	fnt \
	vimb

vm:
	install -Dm600 vimrc ~/.vimrc

ctags:
	install -Dm644 ctags ~/.ctags

sxhkd:
	install -Dm644 config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

gtk:
	install -Dm644 config/gtk-2.0/gtkfilechooser.ini ~/.config/gtk-2.0/gtkfilechooser.ini
	install -Dm644 gtkrc-2.0 ~/.gtkrc-2.0

news:
	install -Dm644 newsbeuter/config ~/.newsbeuter/config
	install -Dm644 newsbeuter/urls ~/.newsbeuter/urls

pdf:
	install -Dm644 config/zathura/zathurarc ~/.config/zathura/zathurarc

tmux:
	install -Dm644 tmux.conf ~/.tmux.conf
	install -Dm644 tmuxinator/cs.yml ~/.tmuxinator/cs.yml

xdg:
	install -Dm644 local/share/applications/vim.desktop ~/.local/share/applications/vim.desktop
	install -Dm644 local/share/applications/zathura-tabbed.desktop ~/.local/share/applications/zathura-tabbed.desktop

shell:
	install -Dm644 zshrc ~/.zshrc

mpd:
	install -Dm644 ncmpcpp/config ~/.ncmpcpp/config
	install -Dm644 mpdconf ~/.mpdconf

gdb:
	install -Dm644 gdbinit ~/.gdbinit

git:
	install gitconfig ~/.gitconfig

#surf:
	#install -Dm644 surf/script.js ~/.surf/script.js

mail:
	install -Dm644 mbsyncrc ~/.mbsyncrc
	install -Dm6644 msmtprc ~/.msmtprc
	install -Dm644 mutt/muttrc ~/.mutt/muttrc

notification:
	install -Dm644 config/dunst/dunstrc ~/.config/dunst/dunstrc

systemd:
	install -Dm644 config/systemd/user/fetchmail.service ~/.config/systemd/user/fetchmail.service
	install -Dm644 config/systemd/user/mpd.service ~/.config/systemd/user/mpd.service
	install -Dm644 config/systemd/user/mpd.socket ~/.config/systemd/user/mpd.socket

x:
	install -Dm644 xinitrc ~/.xinitrc
	install -Dm644 Xresources ~/.Xresources

irc:
	install -Dm644 irssi/config ~/.irssi/config
	install -Dm644 irssi/startup ~/.irssi/startup
	install -Dm644 irssi/xchat.theme ~/.irssi/xchat.theme
	install -Dm644 irssi/xchatnickcolor.pl ~/.irssi/xchatnickcolor.pl
	install -Dm644 irssi/scripts/adv_windowlist.pl ~/.irssi/scripts/adv_windowlist.pl
	install -Dm644 irssi/scripts/hilightwin.pl ~/.irssi/scripts/hilightwin.pl
	install -Dm644 irssi/scripts/history_search.pl  ~/.irssi/scripts/history_search.pl
	install -Dm644 irssi/scripts/nicklist.pl  ~/.irssi/scripts/nicklist.pl
	install -Dm644 irssi/scripts/notify.pl ~/.irssi/scripts/notify.pl

fm:
	install -Dm644 config/ranger/rc.conf ~/.config/ranger/rc.conf
	install -Dm755 config/ranger/scope.sh ~/.config/ranger/scope.sh

comp:
	install -Dm644 config/compton.conf ~/.config/compton.conf

conk:
	install -Dm644 conkyrc ~/.conkyrc
	install -Dm644 conky/conky_widgets.lua ~/.conky/conky_widgets.lua

ply:
	install -Dm644 mplayer/config ~/.mplayer/config

idsk:
	install -Dm644 ideskrc ~/.ideskrc
	install -Dm644 idesktop/launcher.lnk ~/.idesktop/launcher.lnk
	install -Dm644 idesktop/icons/terminal-32x32.png ~/.idesktop/icons/terminal-32x32.png

fnt:
	install -Dm644 fonts/ter-x14n.bdf ~/.fonts/ter-x14n.bdf
	install -Dm644 fonts/xbmicons.bdf ~/.fonts/xbmicons.bdf
	mkfontscale ~/.fonts
	mkfontdir ~/.fonts

vimb:
	install -Dm644 config/vimb/style.css ~/.config/vimb/style.css
	install -Dm644 config/vimb/config ~/.config/vimb/config
	install -Dm644 config/vimb/bookmark ~/.config/vimb/bookmark

