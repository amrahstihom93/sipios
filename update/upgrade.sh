rm ./cleanup.sh  # just making sure there isn't one yet
wget https://raw.githubusercontent.com/amrahstihom93/SiPi_For_Robots/master/jessie-update/jessie-cleanup.sh
chmod +x ./jessie_cleanup.sh
./jessie_cleanup.sh
rm ./jessie_cleanup.sh