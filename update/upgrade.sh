rm ./cleanup.sh  # just making sure there isn't one yet
wget https://raw.githubusercontent.com/SigmawayLLC/sipios/master/update/upgrade.sh
chmod +x ./cleanup.sh
./cleanup.sh
rm ./cleanup.sh

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get -y install avahi-daemon avahi-utils
sudo rm /etc/avahi/avahi-daemon.conf 														# Remove Avahi Config file.
sudo cp /home/pi/si_update/sipi/script/avahi-daemon.conf /etc/avahi 		# Copy new Avahi Config File.
sudo chmod +x /etc/avahi/avahi-daemon.conf 
sudo apt-get install apache2 -y
sudo apt-get install php5 libapache2-mod-php5 -y
sudo apt-get install raspberrypi-net-mods -y
sudo apt-get install wpagui -y
sudo apt-get install scratch -y
sudo apt-get install avahi-autoipd bc python-imaging python-pexpect python-renderpm -y
sudo apt-get install python-reportlab python-reportlab-accel  -y
sudo apt-get install git -y