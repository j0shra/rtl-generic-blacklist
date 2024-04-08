#!/bin/bash

echo "Making sure everything is updated..."
sleep 1

cd ~
sudo apt-get update
sudo apt-get install git
sudo apt-get install cmake
sudo apt-get install build-essential
sudo apt install pkg-config
sleep 1

echo "Installing library.."
sleep 1

sudo apt-get install libusb-1.0-0-dev

sleep 1
echo "Installing RTL-SDR Driver..."
sleep 1

git clone https://gitea.osmocom.org/sdr/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
cd ~
cd rtlsdr-install
sudo mv ~/rtlsdr-install/blacklist-rtl.conf /etc/modprobe.d
cd ~
sleep 1

echo "Your RTL-SDR driver have been installed!"
echo "To test your SDR, type 'rtl_test -s 2400000'"
echo "Your final line should say 'Reading samples in async mode...'"
