#! /bin/bash
# Copyright Sigmaway, 2017.
# Install the Troubleshooting GUI.
# Dev Notes:
# Helpful Link on Bin Paths:  http://www.cyberciti.biz/faq/how-do-i-find-the-path-to-a-command-file/
# needs to be sourced from here when we call this as a standalone

PIHOME=/home/pi
SGMW=Sgmw
SGMW_PATH=$PIHOME/$SGMW
RASPBIAN=$PIHOME/si_update/sipios

PIHOME=/home/pi
RASPBIAN=$PIHOME/si_update/sipios
SGMW=Sgmw
LIB=lib
LIB_PATH=$PIHOME/$SGMW/$LIB
SGMWLIB_PATH=$LIB_PATH/$SGMW
TROUBLESHOOTING=Troubleshooting_GUI
TROUBLESHOOTING_PATH=$SGMWLIB_PATH/$TROUBLESHOOTING

curl --silent https://raw.githubusercontent.com/SigmawayLLC/script_tools/master/install_script_tools.sh | bash
source /home/pi/$SGMW/lib/$SGMW/script_tools/functions_library.sh
create_folder $PIHOME/$SGMW
create_folder $PIHOME/$SGMW/$LIB
create_folder $PIHOME/$SGMW/$LIB/$SGMW
create_folder $PIHOME/$SGMW/$LIB/$SGMW/$TROUBLESHOOTING

if ! quiet_mode
then
	# updated from --force-yes to --yes --force-yes (2nd answer here: http://superuser.com/questions/164553/automatically-answer-yes-when-using-apt-get-install)
	sudo apt-get --purge remove python-wxgtk2.8 python-wxtools wx2.8-i18n -y
	sudo apt-get install python-wxgtk2.8 python-wxtools wx2.8-i18n --yes --force-yes
	sudo apt-get install python-psutil --yes --force-yes
	sudo apt-get install python-wxgtk2.8 python-wxtools wx2.8-i18n --yes --force-yes
fi

sudo cp -f $RASPBIAN/$TROUBLESHOOTING/* $TROUBLESHOOTING_PATH
# Copy shortcut to desktop.
#sudo rm /home/pi/Desktop/Troubleshooting_Start.desktop
# by using -f we force the copy
sudo cp -f $TROUBLESHOOTING_PATH/Troubleshooting_Start.desktop /home/pi/Desktop
# Make shortcut executable
sudo chmod +x /home/pi/Desktop/Troubleshooting_Start.desktop

delete_folder /home/pi/GoBox/Troubleshooting
# Make troubleshooting_start executable.
sudo chmod +x /home/pi/Desktop/GoBox/Troubleshooting_GUI/Troubleshooting_Start.sh