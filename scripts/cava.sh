# Install prerequisites
# Pre-requisites are using Kali Rolling

apt-get -y install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool
cd ~/apps
git clone https://github.com/karlstav/cava
cd cava
bash autogen.sh
./configure
make
make install

