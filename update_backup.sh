#! /bin/bash
# Nuclear Backup Option.  
# Run this with "sudo sh ~/update_backup.sh" in the command line.

sudo rm -r /home/pi/si_update

mkdir /home/pi/si_update
cd /home/pi/si_update
sudo git clone https://github.com/SigmawayLLC/sipios/
cd sipios

cd /home/pi/si_update/sipios/

sudo chmod +x /home/pi/si_update/sipios/update_master.sh
sudo chmod +x /home/pi/si_update/sipios/upd_script/update_all.sh
#sudo chmod +x /home/pi/si_update/sipios/sipi_for_robots_update.py

sudo apt-get install python-wxgtk2.8 python-wxtools wx2.8-i18n --force-yes -y			# Install wx for python for windows / GUI programs.
echo "Installed wxpython tools"
sudo apt-get install python-psutil --force-yes -y
echo "Python-PSUtil"
