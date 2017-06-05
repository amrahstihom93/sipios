if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi

if [[ -f /home/pi/quiet_mode ]];  then
	quiet_mode=1
else
	quiet_mode=0
fi

if [[ "$quiet_mode" -eq "0" ]]
then

	echo "  ____  _                                           ";
	echo " / ___|(_) __ _ _ __ ___   __ ___      ____ _ _   _ ";
	echo " \___ \| |/ _` |  _ ` _ \ / _` \ \ /\ / / _` | | | |";
	echo "  ___) | | (_| | | | | | | (_| |\ V  V / (_| | |_| |";
	echo " |____/|_|\__, |_| |_| |_|\__,_| \_/\_/ \__,_|\__, |";
	echo "          |___/                               |___/ ";
	echo " "
	
fi

PIHOME="/home/pi"
SGMW="Sgmw"
if [ ! -d $PIHOME/$SGMW ] ; then
	echo "Creating $PIHOME/$SGMW"
	mkdir $PIHOME/$SGMW
fi
if [ ! -d $PIHOME/$SGMW/lib ] ; then
	echo "Creating $PIHOME/$SGMW/lib"
	mkdir $PIHOME/$SGMW/lib
fi
if [ -d $PIHOME/$SGMW/lib ] ; then
	echo "Copying libraries into $PIHOME/$SGMW/lib"
	sudo cp -r $PIHOME/si_update/sipios/lib/* $PIHOME/$SGMW/lib
fi

pushd $PIHOME/$SGMW/lib

cd Adafruit
sudo python setup.py install
sudo python3 setup.py install

popd

