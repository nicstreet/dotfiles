#!/bin/bash
# Script to run post install on Kali Linux to restore config.

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Update apt ready for software installations...                               *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

sudo apt-get -qq update

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Install core applications and other prerequisites...                         *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# Install core applications and utilities
sudo apt-get -qq install neofetch
sudo apt-get -qq install compton
sudo apt-get -qq install feh
sudo apt-get -qq install i3
sudo apt-get -qq install xfce4-clipman
sudo apt-get -qq install terminator
sudo apt-get -qq install rofi
sudo apt-get -qq install htop
sudo apt-get -qq install cmatrix
sudo apt-get -qq install deepin-screenshot
sudo apt-get -qq install pavucontrol
sudo apt-get -qq install gdebi
sudo apt-get -qq install virtualbox
sudo apt-get -qq install virtualbox-dkms
sudo apt-get -qq install virtualbox-guest-additions-iso
sudo apt-get -qq install cmus
sudo apt-get -qq install calibre
sudo apt-get -qq install lshw
sudo apt-get -qq install nautilus
sudo apt-get -qq install gnome-screenshot
sudo apt-get -qq install tmux
sudo apt-get -qq install net-tools
sudo apt-get -qq install python3-pip
# sudo apt-get -qq install zim
sudo apt-get -qq install gparted
sudo apt-get -qq install openvpn
sudo apt-get -qq install python-gtksourceview2
sudo apt-get -qq install kazam
sudo apt-get -qq install joplin

# Require for Greenclip
sudo apt-get -qq install xdotool

#Required for i3gaps
sudo apt-get -qq install libxcb-keysyms1-dev
sudo apt-get -qq install libpango1.0-dev
sudo apt-get -qq install libxcb-util0-dev
sudo apt-get -qq install libxcb-icccm4-dev
sudo apt-get -qq install libyajl-dev
sudo apt-get -qq install libstartup-notification0-dev
sudo apt-get -qq install libxcb-randr0-dev
sudo apt-get -qq install libev-dev
sudo apt-get -qq install libxcb-cursor-dev
sudo apt-get -qq install libxcb-xinerama0-dev
sudo apt-get -qq install libxcb-xkb-dev
sudo apt-get -qq install libxkbcommon-dev
sudo apt-get -qq install libxkbcommon-x11-dev
sudo apt-get -qq install autoconf
sudo apt-get -qq install libxcb-xrm-dev
sudo apt-get -qq install libxcb-xrm-dev
sudo apt-get -qq install libxcb1-dev

# Required for ROFI Settings Menu
sudo apt-get -qq install lxappearance
sudo apt-get -qq install gtk-chtheme
sudo apt-get -qq install qt4-qtconfig

# Required for Dunst
sudo apt-get -qq install libnotify-bin
sudo apt-get -qq install dbus-1-dbg

# Required for Sound
sudo apt-get -qq install alsa-tools
sudo apt-get -qq install alsa-utils

# Required for cava (Graphic Equaliser)
sudo apt-get -qq install libfftw3-dev
sudo apt-get -qq install libasound2-dev
sudo apt-get -qq install libncursesw5-dev
sudo apt-get -qq install libpulse-dev
sudo apt-get -qq install libtool

# Required for (other)
sudo apt-get -qq install qml-module-qtquick-window2

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
ln -sv $HOME/dotfiles/startpage/ $HOME/

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Update and Upgrade via apt...                                                *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# Update and Upgrade
# sudo apt-get -qq update
# sudo apt-get -qq upgrade
# sudo apt-get -qq dist-upgrade

echo "*##############################################################################*"
echo "*                                                                              *"
echo "* Create base folders and install packages from other locations...             *"
echo "*                                                                              *"
echo "*##############################################################################*"
echo ""

# configure $HOME/ with appropriate folders
mkdir $HOME/apps
mkdir $HOME/working

# Install Sublime Text
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo apt get install sublime-text

# Install software via PIP (Python)

pip3 install pywal

# Install i3-gaps, configure and build
cd $HOME/apps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# Install greenclip
cd /usr/local/bin
wget https://github.com/erebe/greenclip/releases/download/3.2/greenclip
chmod +x /usr/local/bin/greenclip

# Install cava - Music Visualizer
sudo apt-get -qq install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool
cd $HOME/apps
git clone https://github.com/karlstav/cava
cd cava
bash autogen.sh
./configure
make
make install

# Install dunst
sudo apt-get -qq install dbus libxinerama1 libxrandr2 libxss1 glib pango cairo libgtk-3-dev
sudo apt-get -qq install libpango-1.0-0

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
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# Will need confirmation from user about linking Dropbox account.

# Git Configuration
#echo "*##############################################################################*"
#echo "*                                                                              *"
#echo "* Configure git...                                                             *"
#echo "*                                                                              *"
#echo "*##############################################################################*"
#echo ""
#echo "Enter the Global Username for Git:";
#read GITUSER;
#git config --global user.name "${GITUSER}"
#
#echo "Enter the Global Email for Git:";
#read GITEMAIL;
#git config --global user.email "${GITEMAIL}"
#
#echo 'Git has been configured!'
#git config --list
#
#echo "Configuring /dotfiles...!
#cd ~/dotfiles/
#git add .
#git commit -m "Commit from New PC" --author="Nic Street"
#git push origin master

# To be added:
# polybar from git

#echo "*##############################################################################*"
#echo "*                                                                              *"
#echo "* SUMMARY                                                                      *"
#echo "*                                                                              *"
#echo "*##############################################################################*"
#echo ""
#echo "Status     Version"
#echo "======     ======="
#dpkg-query -W -f='${Status} ${Version}\n' $(cat packages.txt)
