#! /bin/bash

# Update Changes for the Raspberry Pi 3
# These changes were developed by Mohit Sharma.  
# http://www.briandorey.com/post/Raspberry-Pi-3-UART-Overlay-Workaround
# This script was developed by the Sigmaway.
#
# Note this is called from update/update_all.sh 
PIHOME=/home/pi
SGMW=Sgmw
source $PIHOME/$SGMW/lib/$SGMW/script_tools/functions_library.sh

# no need to to apt-get update while in full di_update mode
if ! quiet_mode
    then
    sudo apt-get update -y
fi
#sudo apt-get dist-upgrade -y    # apt-get dist-upgrade is only useful if you change the distribution, for example from wheezy to jessie.
# Commenting out the rpi-update.  
# Note:  https://www.raspberrypi.org/forums/viewtopic.php?f=66&t=137546
# rpi-update is for experimentation only ... or if you like to take risks.
# sudo rpi-update -y

pushd $PIHOME >/dev/null

if grep -q "VERSION_ID=\"8\"" /etc/os-release
then
    #os is Jessie
    sudo sed -i "/dtoverlay=pi3-miniuart-bt-overlay/d" /boot/config.txt
    sudo sed -i "/force_turbo=1/d" /boot/config.txt
    sudo sed -i "/dtoverlay=pi3-miniuart-bt/d" /boot/config.txt
    echo "dtoverlay=pi3-miniuart-bt" >> /boot/config.txt
else
    #os is wheezy
    sudo wget https://github.com/SigmawayLLC/sipios/raw/master/pi3/pi3-miniuart-bt-overlay.dtb
    sudo cp pi3-miniuart-bt-overlay.dtb /boot/overlays
    sudo sed -i "/dtoverlay=pi3-miniuart-bt-overlay/d" /boot/config.txt
    sudo sed -i "/force_turbo=1/d" /boot/config.txt
    sudo sed -i "/dtoverlay=pi3-miniuart-bt/d" /boot/config.txt
    echo "dtoverlay=pi3-miniuart-bt-overlay" >> /boot/config.txt
    echo "force_turbo=1" >> /boot/config.txt
fi
popd >/dev/null

