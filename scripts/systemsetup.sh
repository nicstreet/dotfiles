#!/bin/bash
# Script to run post install on Kali Linux to restore config.

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Update apt ready for software installations...                               *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

apt-get -qq update

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Install core applications and other prerequisites...                         *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# Install core applications and utilities
apt-get -qq install neofetch
apt-get -qq install compton
apt-get -qq install feh
apt-get -qq install i3
apt-get -qq install xfce4-clipman
apt-get -qq install terminator
apt-get -qq install rofi
apt-get -qq install htop
apt-get -qq install cmatrix
apt-get -qq install deepin-screenshot
apt-get -qq install pavucontrol
apt-get -qq install gdebi
apt-get -qq install virtualbox
apt-get -qq install virtualbox-dkms
apt-get -qq install virtualbox-guest-additions-iso
apt-get -qq install cmus
apt-get -qq install calibre
apt-get -qq install lshw
apt-get -qq install nautilus
apt-get -qq install gnome-screenshot
apt-get -qq install tmux
apt-get -qq install net-tools
apt-get -qq install python3-pip
apt-get -qq install zim
apt-get -qq install gparted
apt-get -qq install openvpn

# Require for Greenclip
apt-get -qq install xdotool

#Required for i3gaps
apt-get -qq install libxcb1-dev
apt-get -qq install libxcb-keysyms1-dev
apt-get -qq install libpango1.0-dev
apt-get -qq install libxcb-util0-dev
apt-get -qq install libxcb-icccm4-dev
apt-get -qq install libyajl-dev
apt-get -qq install libstartup-notification0-dev
apt-get -qq install libxcb-randr0-dev
apt-get -qq install libev-dev
apt-get -qq install libxcb-cursor-dev
apt-get -qq install libxcb-xinerama0-dev
apt-get -qq install libxcb-xkb-dev
apt-get -qq install libxkbcommon-dev
apt-get -qq install libxkbcommon-x11-dev
apt-get -qq install autoconf
apt-get -qq install libxcb-xrm-dev

# Required for ROFI Settings Menu
apt-get -qq install lxappearance
apt-get -qq install gtk-chtheme
apt-get -qq install qt4-qtconfig

# Required for Dunst
apt-get -qq install libnotify-bin
apt-get -qq install dbus-1-dbg

# Required for Sound
apt-get -qq install alsa-tools
apt-get -qq install alsa-utils

# Required for cava (Graphic Equaliser)
apt-get -qq install libfftw3-dev
apt-get -qq install libasound2-dev
apt-get -qq install libncursesw5-dev
apt-get -qq install libpulse-dev
apt-get -qq install libtool

# Required for (other)
apt-get -qq install qml-module-qtquick-window2

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Remove files/folders and replace with symlinks...                            *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# Remove existing files/folders and replace with symlinks to dotfiles

rm $HOME/.bashrc

ln -sv $HOME/dotfiles/.bashrc $HOME
ln -sv $HOME/dotfiles/.aliases $HOME
ln -sv $HOME/dotfiles/.functions $HOME
ln -sv $HOME/dotfiles/.Xresources $HOME
ln -sv $HOME/dotfiles/.tmux.conf $HOME
ln -sv $HOME/dotfiles/.config/compton.conf $HOME/.config/
ln -sv $HOME/dotfiles/.config/i3/ $HOME/.config/
ln -sv $HOME/dotfiles/.config/polybar/ $HOME/.config/
ln -sv $HOME/dotfiles/.config/rofi/ $HOME/.config/
ln -sv $HOME/dotfiles/.config/terminator/ $HOME/.config/
ln -sv $HOME/dotfiles/.config/zim/ $HOME/.config/
ln -sv $HOME/dotfiles/.config/dunst/ $HOME/.config/
ln -sv $HOME/dotfiles/cheats/ $HOME/cheats
ln -sv $HOME/dotfiles/nano/ $HOME/nano
ln -sv $HOME/dotfiles/.nanorc $HOME/

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Update and Upgrade via apt...                                                *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# Update and Upgrade
apt-get -qq update
apt-get -qq upgrade
apt-get -qq dist-upgrade

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Create base folders and install packages from other locations...             *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# configure $HOME/ with appropriate folders
mkdir $HOME/apps
mkdir $HOME/working

# Install software via PIP (Python)

pip3 install pywal

# Install i3-gaps, configure and build
cd $HOME/apps
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
apt-get -qq install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool
cd $HOME/apps
git clone https://github.com/karlstav/cava
cd cava
bash autogen.sh
./configure
make
make install

# Install dunst
apt-get -qq install dbus libxinerama1 libxrandr2 libxss1 glib pango cairo libgtk-3-dev
apt-get -qq install libpango-1.0-0

# Move to the /apps folder
cd $HOME/apps

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
cp -a $HOME/dotfiles/icons/* /usr/share/icons/gnome/16x16/status/

# Clean up Apt post installation
apt autoremove

# Install packages via PIP3
sudo pip3 install pywal

# Dropbox installation
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
# Will need confirmation from user about linking Dropbox account.

# Git Configuration
echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Configure git...                                                             *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""
echo "Enter the Global Username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

echo "Configuring /dotfiles...!
cd ~/dotfiles/
git add .
git commit -m "Commit from New PC" --author="Nic Street"
git push origin master

# To be added:
# polybar from git

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* SUMMARY                                                                      *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""
echo "Status     Version"
echo "======     ======="
dpkg-query -W -f='${Status} ${Version}\n' $(cat packages.txt)
