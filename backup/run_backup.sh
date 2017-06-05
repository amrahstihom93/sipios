#!/usr/bin/env bash

screen -d -r local
sudo python /home/pi/si_update/sipios/backup/backup_gui.py
echo "UPDATE FINISHED."
echo "Please close this window."