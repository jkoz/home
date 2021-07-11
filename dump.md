---
layout: post
title: technical dump 
permalink: /technicaldump/
---

# abstract

The purpose of this personal blog is to provide information about me and centralize my technical and academic notes.

# markdown

- this is emphasize _emphasize_
- __bold__
- those are snippet code
- this is ~~deleted text~~
- feas*ible*

```python
    def add:
        print("asd")
```

```java
    public class SingletonF {
        public static SingletonF _instance;
    }
```
- here is further learning format [Further markdown syntax](http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html)

- formatusb stick
fdisk /dev/sdb1
mkfs.ntfs /dev/sdb1

# R

sudo pacman -S r
sudo R
install.packages("ggplot2")

# Xdg

- My define type

xdg-mime default feh.desktop image/jpeg
xdg-mime default zathura-tabbed.desktop application/pdf
xdg-mime default vim.desktop text/plain
xdg-mime default vim.desktop application/octet-stream
xdg-mime default vim.desktop text/x-c
xdg-mime default vim.desktop text/x-shellscript
xdg-mime default transmission-cli.desktop x-scheme-handler/magnet
xdg-mime default transmission-cli.desktop application/x-bittorrent

- Get type

xdg-mime query default image/jpeg
xdg-mime query default application/pdf
xdg-mime query default text/plain

# xwininfo

- List windows, including hidden one

xwininfo -root -children

- List all windows, including nested window

xwininfo -root -all

# arch packages

    pacman -S --noconfirm pass
    pacman -S --noconfirm parted
    pacman -S --noconfirm acpi # battery info
    pacman -S --noconfirm ntp && systemctl enable ntpd || { exit 1; } # sync time
    yaourt -S --noconfirm ntfs-3g simple-mtpfs # mount camera and ntfs
    pacman -S --noconfirm android-tools android-udev # android
    pacman -S --noconfirm zip unzip unrar
    pacman -S --noconfirm xorg xorg-server xorg-xinit
    pacman -S --noconfirm cowsay
    pacman -S --noconfirm xautolock x11vnc
    pacman -S --noconfirm xdg-user-dirs && xdg-user-dirs-update
    pacman -S --noconfirm xclip
    pacman -S --noconfirm libxcb xcb-util xcb-util-keysyms xcb-util-wm # xcb tools
    pacman -S --noconfirm words # dictionary used in vim
    yaourt -S --noconfirm xdo-git # like xdotool
    yaourt -S --noconfirm sxhkd-git # bindkeys in x
    yaourt -S --noconfirm mt7601u-dkms # wifi mt7601u
    # pacman -S --noconfirm chromium
    # yaourt -S --noconfirm chromium-pepper-flash
    yaourt -S google-chrome
    pacman -S --noconfirm transmission-cli # torrent
    pacman -S --noconfirm libnotify dunst
    pacman -S --noconfirm mplayer
    pacman -S --noconfirm ffmpeg # streaming & screencast
    pacman -S --noconfirm mupdf
    yaourt -S --noconfirm cabaretstage pdftk zathura # pdf
    yaourt -S --noconfirm tmuxinator # tmux layout
    pacman -S --noconfirm cups # print
    pacman -S --noconfirm feh
    pacman -S --noconfirm imagemagick
    pacman -S --noconfirm gimp
    pacman -S --noconfirm r # R languagee for statistics
    pacman -S --noconfirm scrot
    pacman -S --noconfirm xorg-xlsfonts
    pacman -S --noconfirm tk # for gitk
    yaourt -S --noconfirm gcalcli # google calendar commandline
    yaourt -S --noconfirm silver-searcher-git
    pacman -S --noconfirm libxft  # dwm, dmenu, st with xft
    pacman -S --noconfirm freetype2
    pacman -S --noconfirm go # golang
    pacman -S --noconfirm webkitgtk2 # surf
    yaourt -S --noconfirm dropbox-cli # cloud dropbox
    yaourt -S --noconfirm googlecl
    yaourt -S --noconfirm archey # status
    yaourt -S --noconfirm ttf-ms-fonts # status
    yaourt -S --noconfirm adobe-source-code-pro-fonts # current used font
    yaourt -S --noconfirm ttf-chromeos-fonts # cousine
    pacman -S --noconfirm mercurial subversion cvs
    pacman -S --noconfirm cdrkit dvd+rw-tools # cd kit
    sudo pacman -S lshw # view hardware specs
    pacman -S --noconfirm bitlbee irssi # irc, chat
    pacman -S --noconfirm mpd mpc ncmpcpp # mp3 player
    pacman -S --noconfirm gnuplot # plotting tool
    pacman -S --noconfirm mutt fetchmail procmail # mail
    pacman -S --noconfirm redshift # automatically change color temperature
    pacman -S --noconfirm unclutter # automatically hide cursor when inactive
    pacman -S --noconfirm fish fbterm # some terminals
    pacman -S --noconfirm cabextract # extract .cab file
    pacman -S --noconfirm cmake gdb  graphviz doxygen valgrind # developer tools for c
    yaourt -S --noconfirm scanmem # game hacking program, scanmem and change value
    pacman -S --noconfirm ecm # convert ecm to bin - unecm *bin.ecm *bin
    yaourt -S --noconfirm stardict-longman # dictionary
    pacman -S --noconfirm pulseaudio pulseaudio-alsa
    pacman -S --noconfirm texlive-core # latex
    pacman -S --noconfirm texlive-localmanager-git # latex package manager
    yaourt -S pandoc-static # pandoc
    cd ~ && pkg=~/github/jkoz/PKGBUILDs && rm -rf $pkg && git clone https://github.com/jkoz/PKGBUILDs $pkg && \
        cd $pkg && for dir in `ls $pkg`; do cd $dir; ls | grep -v PKGBUID | xargs ;  makepkg --noconfirm -si --asroot; cd .. ; done
    yaourt -S shrew-vpn-client # VPN: mkdir -p ~/.ike/sites/ && touch tptai.vpn && ikec -r tptai.vpn -u user -p pwd -a &
    yaourt -S --noconfirm compton # 14.8 composite
    pacman -S --noconfirm perl-cpanplus-dist-arch python-pip python2-pip # pip and cpan
    pacman -S --noconfirm ranger-git # file manager
    pacman -S --noconfirm w3m # display photo in ranger
    yaourt -S --noconfirm gbdfed pcf2bdf # font editors
    yaourt -S --noconfirm xtitle-git bar-aint-recursive bspwm-git
    pacman -S --noconfirm dnsutils
    yaourt -S --noconfirm stardict-tools dictconv stardict makedict sdcv # dict tools
    pacman -S --noconfirm lm_sensors # WTF this thing?
    pacman -S --noconfirm aircrack-ng # wifi crack tools 
    yaourt -S --noconfirm crunch # wordlist generator http://adaywithtape.blogspot.ca/2011/05/creating-wordlists-with-crunch-v30.html
    yaourt -S --noconfirm jdk && archlinux-java set java-8-jdk
    yaourt -S --noconfirm android-studio

# use hash for password in WPA supplicant

- storing as 'password=hash:<hash>'

```sh
    echo "asfds dfs" | /usr/bin/tr -d '[:space:]' | iconv -t utf16le | openssl md4
```

# git

- submodules with native plugins support

cd ~/github/home
git submodule add https://github.com/tpope/vim-surround vim/pack/plugins/start/vim-surround
git submodule add https://github.com/tpope/vim-commentary vim/pack/plugins/start/vim-commentary
git submodule add https://github.com/tpope/vim-fugitive vim/pack/plugins/start/vim-fugitive

git submodule add https://github.com/tpope/vim-fugitive vim/pack/plugins/start/vim-fugitive
git submodule add https://github.com/tpope/vim-vinegar vim/pack/plugins/start/vim-vinegar
git submodule add https://github.com/tpope/vim-repeat vim/pack/plugins/start/vim-repeat
git submodule add https://github.com/tpope/vim-unimpaired vim/pack/plugins/start/vim-unimpaired
git submodule add https://github.com/tpope/vim-dispatch vim/pack/plugins/start/vim-dispatch
git submodule add https://github.com/tpope/vim-rsi vim/pack/plugins/start/vim-rsi
git submodule add https://github.com/tpope/vim-endwise vim/pack/plugins/start/vim-endwise
git submodule add https://github.com/tpope/vim-abolish vim/pack/plugins/start/vim-abolish

git submodule add https://github.com/gavinbeatty/dragvisuals.vim vim/pack/plugins/start/dragvisuals.vim

git submodule add https://github.com/masukomi/vim-markdown-folding vim/pack/plugins/start/vim-markdown-folding

git submodule add https://github.com/liuchengxu/vista.vim vim/pack/plugins/start/vista.vim
git submodule add https://github.com/liuchengxu/vim-which-key vim/pack/plugins/start/vim-which-key

git submodule add https://github.com/altercation/vim-colors-solarized vim/pack/plugins/start/vim-colors-solarized

git submodule add https://github.com/junegunn/fzf.vim vim/pack/plugins/start/fzf.vim
git submodule add https://github.com/junegunn/goyo.vim vim/pack/plugins/start/goyo.vim
git submodule add https://github.com/junegunn/vim-easy-align vim/pack/plugins/start/vim-easy-align

git submodule add https://github.com/dhruvasagar/vim-table-mode vim/pack/plugins/start/vim-table-mode

git submodule add https://github.com/easymotion/vim-easymotion vim/pack/plugins/start/vim-easymotion

git submodule add https://github.com/simeji/winresizer vim/pack/plugins/start/winresizer

git submodule add https://github.com/airblade/vim-gitgutter vim/pack/plugins/start/vim-gitgutter

git submodule add https://github.com/natebosch/vim-lsc vim/pack/plugins/start/vim-lsc

git submodule add https://github.com/Yggdroot/indentLine vim/pack/plugins/start/indentLine

git submodule add https://github.com/hrsh7th/vim-vsnip vim/pack/plugins/start/vim-vsnip
git submodule add https://github.com/hrsh7th/vim-vsnip-integ vim/pack/plugins/start/vim-vsnip-integ

git submodule add https://github.com/reedes/vim-pencil vim/pack/plugins/start/vim-pencil
git submodule add https://github.com/reedes/vim-litecorrect vim/pack/plugins/start/vim-litecorrect
git submodule add https://github.com/reedes/vim-lexical vim/pack/plugins/start/vim-lexical

- update all sub branches plugins

git pull --recurse-submodules
git submodule update --recursive --remote
git submodule update --remote --merge
git commit

- first time checkout repo and fetch submodule
git submodule update --init --recursive --remote

- remove a package

git submodule deinit vim/pack/shapeshed/start/vim-airline
git rm vim/pack/shapeshed/start/vim-airline
rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
git commit

- unstage files and directories which was added by git add or git submodule add, without changing anything

git reset --soft HEAD~1

- config

git config --global http.proxy http://10.10.10.10:8080
git config --global --unset http.proxy
git config --global http.proxy

- create new branch

git branch dmenu2_new_keybind

- create new branch and checkout it

git checkout -b new_leaf

- cache password for period of time

> git config --global credential.helper 'cache --timeout=3600'

- diff between 2 versions

> git diff 75e2a99be3d82a4ced8ba306db052105d41c8c37..HEAD

- show current revision

> git describe --tags

- checkout latest code

> git checkout master

- list all releases

> git branch -r

- delete the most unpushed commits

> git reset --soft HEAD~5

- checkout specific release

> git checkout tags/6.0

- git merge

> git merge some_feature_branch

- git display merge info

> git branch --merged

- git diff with vim

> git difftool --tool=vimdiff

- view local unpushed git commits

git log origin/master..HEAD
git diff origin/master..HEAD

- git delete remote branch

> git push origin --delete xft-config

- new git repo


git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/jkoz/vim-bundle.git
git push -u origin master


# network manager

pacman -S networkmanager
pacman -S network-manager-applet gnome-icon-theme

- configure network manager with nmcli or nmtui

# vim

-count selected words
    - select a paragraph
    - press g, then ctrl-g

- c-w o: maximize current window
- c-{HJKL}: move current window around

# pdf

- concatenate

> pdftk 1.pdf 2.pdf cat output output.pdf

- convert pdf to text

> pdftotext

- rotate 270 left

> pdftk _stdin_.pdf cat 1-endW output out.pdf

- resize pdf

> pdf2ps _stdin_.pdf large.pdf && ps2pdf large.pdf smal.pdf && rm large.pdf
> gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -sOutputFile=new_file.pdf original_file.pdf

- extract pdf pages

> pdftk A=Writing_Academic_English.pdf cat A300-308 output conjunctions.pdf

- fix discrupted pdf

> pdftk conjunctions.pdf output conjunctions_fixed.pdf

# nodejs, reactjs

# rotate photos

```sh
    jhead -autorot .JPG
```

# Yay

git clone https://github.com/Jguer/yay && cd yay && makepkg -si

# z-wave, home assistant, aeotec z stick 

- https://thelazyhacker.com/installing-aeotec-z-stick-gen5-with-home-assistant/
pip install homeassistant homeassistant-cli
pip uninstall homeassistant
sudo pacman -S home-assistant
sudo systemctl status home-assistant
vimb http://localhost:8123

# latex

# Root mount for specific user
sudo mount -o gid=users,fmask=113,dmask=002 /dev/sdb1 /mnt/usb

# Md5
md5sum -c razor-mmb29q-factory-0fe7279d.tgz.md5

# aircrack

- Create interface

```sh
sudo airmon-ng start wlp0s29u1u2
```

- Dump all ESSIDs, and pick one target (note bssid, essid, and channel)

```sh
sudo airodump-ng mon0
```

- Dump targeted ESSID

```sh
cd /tmp && sudo airodump-ng --channel 1 --bssid 10:9F:A9:EC:25:3F -w file-<essid> mon0
```

- Replay until get WPA handshake, note that

```sh
sudo aireplay-ng -0 10000 -a 10:9F:A9:EC:25:3F<BSSID> -c 74:F0:6D:3F:17:FA<STATION MAC> mon0
```

- Check pwd db

```sh
sudo aircrack-ng -w ~/Downloads/password-dir/1 -b 10:9F:A9:EC:25:3F<WPA handshake> file-<essid>*.cap
```

# systemctl

- scanning for new & changes
systemctl daemon-reload  

- disable auto suspended on laptop; add HandleLidSwitch=ignore in /etc/systemd/logind.conf
systemctl restart systemd-logind  

- list user units
systemctl --user list-unit-files 

- enable users units 
systemctl --user enable mpd

# zip

zip -r file.zip *

# netctl

- packages

> pacman -S wpa_actiond ifplugd

- start services

```sh
    systemctl enable netctl-auto@wlp0s29u1u2
    systemctl enable netctl-ifplugd@enp3s0
```

- eduroam configuration

```sh
    $ cat /etc/netctl/wlp0s29u1u2-eduroam
    Connection='wireless'
    Interface=wlp0s29u1u2
    Security='wpa-configsection'
    Description="Macewan eduroam network"
    IP='dhcp'
    TimeoutWPA=30
    WPAConfigSection=(
        'ssid="MacEwanSecure"'
        'proto=RSN WPA'
        'key_mgmt=WPA-EAP'
        'eap=TTLS'
        'phase2="auth=MSCHAPV2"'
        'anonymous_identity="anonymous"'
        'identity="user"'
        'password=hash:12345677888174156f8abc7caab7f'
    )
```

# Install archlinux

- enable internet access
iwd dhcpd dhclient wifi-menu dialog wpa_supplicant

- install yay 
git clone https://github.com/Jguer/yay && cd yay && makepkg -si

- install rbenv with yay


```sh
    # network
    wifi-menu
    systemctl start netctl-auto@wlan0
    systemctl start ntpd

    # git & scripts
    pacman -S vim tmux git
    git clone https://github.com/jkoz/home jkoz/home
    cd /root/jkoz/home && INSTALL

    # hostname
    echo "jkoz_arch_linux" > /etc/hostname

    # locale
    sed -i 's!#en_US.UTF-8 UTF-8!en_US.UTF-8 UTF-8!' /etc/locale.gen
    sed -i 's!#en_US ISO-8859-1!en_US ISO-8859-1!' /etc/locale.gen
    locale-gen
    localectl set-locale LANG=en_US.UTF-8

    # swap caps
    echo "KEYMAP=\"emacs2\"" > /etc/vconsole.conf

    # create users
    useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power -d/home/tait -s /usr/bin/zsh tait

    pacman -S bc elinks zsh sudo xclip axel zip unzip unrar rtorrent alsa-utils samba openssh ranger net-tools wireless_tools ntfs-3g mpd

    # yay
    pacman -S base-devel
    cd ~/github && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

    # wm
    pacman -S xdotool xorg xorg-server xorg-xinit xlockmore rxvt-unicode xautolock
    pacman -S libxcb xcb-util xcb-util-keysyms xcb-util-wm bspwm-git
    yaourt -S sxhkd-git xtitle-git bar-aint-recursive
```

# Github pages

cd ~/github/jkoz.github.io && bundle exec jekyll serve --host=0.0.0.0`

# CD DVD

growisofs -Z /dev/cdrom /home/tait/Downloads/archlinux-2015.12.01-dual.iso

# crontab

*/3 * * * * export DISPLAY=:0; find ~/Dropbox/Pictures -type f | shuf -n1 | xargs feh --bg-center
*/3 * * * * mbsync gmail-phuoctaitp
*/3 * * * * mbsync hotmail-tait


# Printing with cups

# CAN BUS

yaourt -S can-utils

- set up virtual can bus

``` sh 
cangen vcan0 -v
cansniffer -c vcan0
candump -l vcan0
```

# Rclone

1. create rclone config
  > rclone config
2. check if it is working
  > rclone lsd gdrive:
3.try to mount manually
  > rclone mount gdrive: /home/tait/gdrive
4. automatically mounted with systemd
  > systemctl --user start rclone-gdrive
  > systemctl --user start rclone-dropbox

# Jo

jo -p email=tait@gmail.com client_id=sdfasdfas secret=sadfadsfdas
jo -p name=JP object=$(jo fruit=Orange point=$(jo x=10 y=20) number=17) sunday=false
