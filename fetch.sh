#! /bin/bash
echo "Update"
echo "This is a crossover for updating Sigmaway Sipi for Robots."
echo "This should update the 2017.01.20 image to the 2017.06 image."
echo "The only time you would run this is if you have an old version of the image.  This will update it to the latest version."

##############################################################################################################
# This is a crossover version for update.  This should update the 2015.03.20 image to the 2015.10 image.
##############################################################################################################
# 1.    Update the Source Files.  Pull the Sipi for robots Github repo and put it in a subdirectory of pi.
#		Get the latest update information.

# If the directory exists, delete it.

if [ -d /home/pi/si_update ] ; then
	sudo rm -r /home/pi/si_update
fi

# Make the directory again.  Clone into it.  
mkdir /home/pi/si_update
cd /home/pi/si_update
sudo git clone https://github.com/SigmawayLLC/sipios/
cd sipios
cd /home/pi/si_update/sipios/

echo "Install wxpython tools"
sudo apt-get install python-wxgtk2.8 python-wxtools wx2.8-i18n --force-yes			# Install wx for python for windows / GUI programs.
sudo apt-get install python-psutil --force-yes

# Took this part out, it was for staging.
# git checkout update201507

# Make files executable.
echo "MAKE FILES EXECUTABLE."
echo "=============================="
sudo chmod +x /home/pi/si_update/sipios/update_master.sh
sudo chmod +x /home/pi/si_update/sipios/upd_script/update_all.sh
sudo chmod +x /home/pi/si_update/sipios/sipi_for_robots_update.py
sudo rm /home/pi/Desktop/upd_start.desktop

sudo zenity --info --text="ALERT!  \n This update will change your \n hostname from raspberrypi to sig.  \n To logon, use sig.local or pi@sig.local \n after this update is complete.";

echo " █████╗ ██╗     ███████╗██████╗ ████████╗";
echo "██╔══██╗██║     ██╔════╝██╔══██╗╚══██╔══╝";
echo "███████║██║     █████╗  ██████╔╝   ██║   ";
echo "██╔══██║██║     ██╔══╝  ██╔══██╗   ██║   ";
echo "██║  ██║███████╗███████╗██║  ██║   ██║   ";
echo "╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ";
echo "                                         ";
echo "VERY IMPORTANT TO NOTE:  ";
echo "This will change your hostname from";
echo "raspberrypi to sig";  
echo "To logon, use pi@sig.local";

echo "Press Enter to continue."
read

# Run the update master program.  
sudo sh /home/pi/si_update/sipios/update_master.sh
sudo sh /home/pi/si_update/sipios/upd_script/update_all.sh