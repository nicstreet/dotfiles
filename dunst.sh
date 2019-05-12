# Install prerequisites
# Pre-requisites are using Kali Rolling

apt-get -y install dbus libxinerama1 libxrandr2 libxss1 glib pango cairo libgtk-3-dev
apt-get -y install libpango-1.0-0

# Move to the /apps folder
cd ~/apps

# Clone from git and then make / install
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

