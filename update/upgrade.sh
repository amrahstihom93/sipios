rm ./cleanup.sh  # just making sure there isn't one yet
wget https://raw.githubusercontent.com/SigmawayLLC/sipios/master/update/upgrade.sh
chmod +x ./jessie_cleanup.sh
./jessie_cleanup.sh
rm ./jessie_cleanup.sh