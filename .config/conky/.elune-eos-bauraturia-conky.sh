#!/bin/bash
#This Script is written by Umair - http://www.NoobsLab.com
#To setup conky

echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+
 |N o o b s L a b . c o m|
 +-+-+-+-+-+-+-+-+-+-+-+-+
"
if [ -d "$HOME/.conky" ]; then
	rm -r $HOME/.conky* 2> /dev/null
elif [ -d "$HOME/.start-conky" ]; then
	rm $HOME/.start-conky 2> /dev/null
elif [ -f "$HOME/.config/autostart/start-conky.desktop" ]; then
	rm $HOME/.config/autostart/start-conky.desktop 2> /dev/null
elif [ -f "$HOME/.config/autostart/conky*" ]; then
	rm $HOME/.config/autostart/conky* 2> /dev/null
fi

echo "It offers you 3 conkys Bauraturia, Elune and eOS."
echo ""
echo "Select conky and enter number....."
echo "Enter 1 for Bauraturia."
echo "Enter 2 for Elune."
echo "Enter 3 for eOS."
echo "Type: "
read InputConky

if [ $InputConky = "1" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O bauraturia-conky.zip http://drive.noobslab.com/data/conky/eos-elune-bauraturia/bauraturia-conky.zip
	  unzip -o bauraturia-conky.zip -d $HOME/
	  rm bauraturia-conky.zip
	}
elif [ $InputConky = "2" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O elune-conky.zip http://drive.noobslab.com/data/conky/eos-elune-bauraturia/elune-conky.zip
	  unzip -o elune-conky.zip -d $HOME/
	  rm elune-conky.zip
	}
elif [ $InputConky = "3" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O eos-conky.zip http://drive.noobslab.com/data/conky/eos-elune-bauraturia/eOS-conky.zip
	  unzip -o eos-conky.zip -d $HOME/
	  rm eos-conky.zip
	}
else
	echo "Input is invalid!!!"
fi

echo "Installation Finished..."
sleep 3
clear

echo "Now configure conky for your desktop."
sleep 2
echo ""
echo "How to use this setup"
echo ""
echo "For Unity, Gnome Classic, Mate, XFCE and Others environment you have to type: ugmx"
echo "For Gnome Shell and Cinnamon environments you have to type: gnome"
sleep 2
echo ""
echo ".........................................."
echo ".........................................."
echo ""
DPATH="$HOME/.conkyrc"
TFILE="/tmp/out.tmp.$$"
echo "Which environment you are using? "
echo "ugmx <- For Unity, Gnome Classic, Mate, XFCE, and Other environments"
echo "gnome <- For Gnome Shell and Cinnamon environments"
echo ""
echo "Type: "
read ENVIR
OVERRIDE="own_window_type override"
DESKTOP="own_window_type conky"
for File in $DPATH
do
	if [ $ENVIR = "ugmx" ]; then
	{
		if [ -f $File -a -r $File ]; then
		sed "s/$DESKTOP/$OVERRIDE/g" "$File" > $TFILE && mv $TFILE "$File"
		else
   		echo "Error: Conkyrc file is not installed $File"
  		fi
	}
	elif [ $ENVIR = "gnome" ]; then
	{
		if [ -f $File -a -r $File ]; then
		sed "s/$OVERRIDE/$DESKTOP/g" "$File" > $TFILE && mv $TFILE "$File"
		else
		echo "Error: Conkyrc file is not installed $File"
  		fi
	}
	else
		echo "Invalid input!!!"
	fi
done
echo "Installation Finished..."
clear

echo "Adding conky to start up"
sleep 3
if [ -d "$HOME/.config/autostart" ]; then
	cd && wget -O .start-conky http://drive.noobslab.com/data/conky/eos-elune-bauraturia/start-conky
	chmod +x $HOME/.start-conky
	wget -O start-conky.desktop http://drive.noobslab.com/data/conky/eos-elune-bauraturia/start-conky.desktop
	mv -f $HOME/start-conky.desktop $HOME/.config/autostart/
else
	mkdir $HOME/.config 2> /dev/null
	mkdir $HOME/.config/autostart
	cd && wget -O .start-conky http://drive.noobslab.com/data/conky/eos-elune-bauraturia/start-conky
	chmod +x $HOME/.start-conky
	wget -O start-conky.desktop http://drive.noobslab.com/data/conky/eos-elune-bauraturia/start-conky.desktop
	mv -f $HOME/start-conky.desktop $HOME/.config/autostart/
fi
ACC_NAME=$(whoami)
sed -i -e "s/NoobsLab/$ACC_NAME/g" "$HOME/.config/autostart/start-conky.desktop"
echo "Successfully added to startup"
sleep 3
clear

echo "System is Updating fonts ..."
echo "System needs permissions to update fonts cache."
sleep 1
sudo fc-cache -fv

echo "Weather Setup: See weather image at NoobsLab.com then proceed to steps"
echo "Go to this URL to collect weather code. Press Ctrl + Right click on link to open it."
echo ""
echo "http://weather.yahoo.com/"
echo ""
echo "Enter your city weather code:"
read WeatherCode
sed -i -e "s/44418/$WeatherCode/g" "$HOME/.conkyrc"
echo "Weather code added"
echo ""
echo ".........................................."
echo ""
echo "If you made any mistake then repeat process, if not then just move on"
sleep 3
clear
echo "For more visit on site - http://www.NoobsLab.com"
rm $HOME/.elune-eos-bauraturia-conky.sh 2> /dev/null
