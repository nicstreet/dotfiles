#!/bin/bash

# Crude script to run post install on Kali Linux to restore config.

# Install core applications and utilities
apt-get -y install neofetch compton feh i3 xfce4-clipman deepin-screenshot terminator rofi htop cmatrix 
apt-get -y install pavucontrol gdebi virtualbox virtualbox-dkms virtualbox-guest-additions-iso
apt-get -y install cmus calibre lshw gotop
# Require for Greenclip
apt-get -y install xdotool
# Install i3-gaps and other prerequisites

#Required for i3gaps
apt-get -y install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev
apt-get -y install libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev
apt-get -y install libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev

# Required for ROFI Settings Menu
apt-get -y install lxappearance gtk-chtheme qt4-qtconfig

# Required for Dunst
apt-get -y install libnotify-bin dbus-1-dbg

# Required for Sound
apt-get -y install alsa-tools alsa-utils
# Required for cava (Graphic Equaliser)

apt-get -y install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool

#Required for (other)
apt-get -y qml-module-qtquick-window2

# Clone dotfiles git repository
git clone https://github.com/nicstreet/dotfiles dotfiles

# Remove existing files/folders and replace with symlinks to dotfiles

rm ~/.bashrc

ln -sv ~/dotfiles/.bashrc ~
ln -sv ~/dotfiles/.aliases ~
ln -sv ~/dotfiles/.functions ~
ln -sv ~/dotfiles/.Xresources ~
ln -sv ~/dotfiles/.tmux.conf ~
ln -sv ~/dotfiles/.config/compton.conf ~/.config/
ln -sv ~/dotfiles/.config/i3/ ~/.config/
ln -sv ~/dotfiles/.config/polybar/ ~/.config/
ln -sv ~/dotfiles/.config/rofi/ ~/.config/
ln -sv ~/dotfiles/.config/terminator/ ~/.config/
ln -sv ~/dotfiles/.config/zim/ ~/.config/

# Update and Upgrade
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

# configure ~/ with appropriate folders
mkdir ~/apps
mkdir ~/working

# Install i3-gaps, configure and build
cd ~/apps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
../configure --prefix=/usr --sysconfdir=/etc
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

# Install greenclip
cd /usr/local/bin
wget https://github.com/erebe/greenclip/releases/download/3.2/greenclip
chmod +x /usr/local/bin/greenclip

# Install cava - Music Visualizer
apt-get -y install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool
cd ~/apps
git clone https://github.com/karlstav/cava
cd cava
bash autogen.sh
./configure
make
make install

# Install dunst
apt-get -y install dbus libxinerama1 libxrandr2 libxss1 glib pango cairo libgtk-3-dev
apt-get -y install libpango-1.0-0

# Move to the /apps folder
cd ~/apps

# Clone from git and then make / install
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

# Install additional fonts
cd /usr/share/fonts/truetype
git clone https://github.com/AppleDesignResources/SanFranciscoFont

# Copy required files into directories
# Dunst icons
cp -a ~/dotfiles/icons/* /usr/share/icons/gnome/16x16/status/


# To be added:
# Dropbox integration
# Opera install
# pywal from git
# polybar from git

