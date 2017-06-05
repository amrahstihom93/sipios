rm ./cleanup.sh  # just making sure there isn't one yet
wget https://raw.githubusercontent.com/SigmawayLLC/sipios/master/update/cleanup.sh
chmod +x ./cleanup.sh
./cleanup.sh
rm ./cleanup.sh