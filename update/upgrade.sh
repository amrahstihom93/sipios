rm ./cleanup.sh  # just making sure there isn't one yet
wget https://raw.githubusercontent.com/SigmawayLLC/sipios/master/update/upgrade.sh
chmod +x ./cleanup.sh
./cleanup.sh
rm ./cleanup.sh

sudo apt-get update -y
sudo apt-get upgrade -y