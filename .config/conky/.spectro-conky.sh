#!/bin/bash
#This Script is written by Umair - Copyright© http://www.NoobsLab.com
#To setup conky

echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+
 |N o o b s L a b . c o m|
 +-+-+-+-+-+-+-+-+-+-+-+-+
"
killall conky 2> /dev/null
if [ -d "$HOME/.conky" ]; then
	rm -r $HOME/.conky 2> /dev/null
elif [ -d "$HOME/.start-conky" ]; then
	rm $HOME/.start-conky 2> /dev/null
elif [ -f "$HOME/.config/autostart/start-conky.desktop" ]; then
	rm $HOME/.config/autostart/start-conky.desktop 2> /dev/null
elif [ -f "$HOME/.config/autostart/conky*" ]; then
	rm $HOME/.config/autostart/conky* 2> /dev/null
fi

echo "It offers you 5 conkys pack Bauraturia, Elune, Flat, Flat-Dark and Numix."
echo ""
echo "Select conky and enter number....."
echo "Enter 1 for Bauraturia."
echo "Enter 2 for Elune."
echo "Enter 3 for Flat."
echo "Enter 4 for Flat Dark."
echo "Enter 5 for Numix."
echo "Type: "
read InputConky

if [ $InputConky = "1" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O bauraturia-conky.zip http://drive.noobslab.com/data/conky/spectro/bauraturia-p.zip
	  unzip -o bauraturia-conky.zip -d $HOME/
	  rm bauraturia-conky.zip
	}
elif [ $InputConky = "2" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O elune-conky.zip http://drive.noobslab.com/data/conky/spectro/elune-p.zip
	  unzip -o elune-conky.zip -d $HOME/
	  rm elune-conky.zip
	}
elif [ $InputConky = "3" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O flat-conky.zip http://drive.noobslab.com/data/conky/spectro/flat-p.zip
	  unzip -o flat-conky.zip -d $HOME/
	  rm flat-conky.zip
	}

elif [ $InputConky = "4" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O flat-dark-conky.zip http://drive.noobslab.com/data/conky/spectro/flat-dark-p.zip
	  unzip -o flat-dark-conky.zip -d $HOME/
	  rm flat-dark-conky.zip
	}

elif [ $InputConky = "5" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O numix-conky.zip http://drive.noobslab.com/data/conky/spectro/numix-p.zip
	  unzip -o numix-conky.zip -d $HOME/
	  rm numix-conky.zip
	}
else
	echo "Input is invalid!!!"
fi

echo ""
echo "Checking if conky weather folder exist."
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1
if [ -d "$HOME/.conky-weather" ]; then
	echo "Yes, weather icons installed."
else
	echo "Doesn't exist, Downloading Weather icons"
	cd && wget -O weatherc.zip http://drive.noobslab.com/data/conky/spectro/cweather.zip
	unzip -o weatherc.zip -d $HOME/
	rm weatherc.zip
fi

echo ""
echo "Checking if fonts are installed."
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1
if [[ -f "$HOME/.fonts/DroidSans.ttf" && -f "$HOME/.fonts/Raleway-Regular.ttf" ]]; then
	echo "Yes, fonts are installed"
else
	echo "Fonts doesn't exist for this conky."
	echo "Downloading Fonts for conky."
	cd && wget -O cfonts.zip http://drive.noobslab.com/data/conky/spectro/cfonts.zip
	unzip -o cfonts.zip -d $HOME/
	rm cfonts.zip
fi
echo ""
echo "Installation Finished..."
sleep 3
clear

echo "Now configuring conky for your desktop."
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
clear
echo "Installation Finished..."
clear

echo "Adding conky to start up"
sleep 3
if [ -d "$HOME/.config/autostart" ]; then
	cd && wget -O .start-conky http://drive.noobslab.com/data/conky/start-conky
	chmod +x $HOME/.start-conky
	wget -O start-conky.desktop http://drive.noobslab.com/data/conky/spectro/start-conky.desktop
	mv -f $HOME/start-conky.desktop $HOME/.config/autostart/
else
	mkdir $HOME/.config 2> /dev/null
	mkdir $HOME/.config/autostart
	cd && wget -O .start-conky http://drive.noobslab.com/data/conky/start-conky
	chmod +x $HOME/.start-conky
	wget -O start-conky.desktop http://drive.noobslab.com/data/conky/spectro/start-conky.desktop
	mv -f $HOME/start-conky.desktop $HOME/.config/autostart/
fi
ACC_NAME=$(whoami)
sed -i -e "s/NoobsLab/$ACC_NAME/g" "$HOME/.config/autostart/start-conky.desktop"
echo "Successfully added to startup"
sleep 3
clear

echo "Select you want to show Temperature in 'Celsius' or 'Farenheit'?"
echo "Enter f for Farenheit:"
echo "Enter c for Celsius:"
read InputFWeather

if [ $InputFWeather = "f" ]; then
	{
		sed -i -e "s/u=c/u=f/g" "$HOME/.conkyrc"
	}
elif [ $InputFWeather = "c" ]; then
	{
		sed -i -e "s/u=f/u=c/g" "$HOME/.conkyrc"
	}
else
	echo "Input is invalid!!!"
fi

echo ""
echo "Weather Setup: See weather image at NoobsLab.com then proceed to next step"
echo "Go to the following URL to collect weather code. Press Ctrl + Right click on link to open it."
echo ""
echo "Hint: search your city and find code at the end of URL"
echo "Opening link in browser."
sleep 2
if which xdg-open > /dev/null
then
	xdg-open http://weather.yahoo.com/ 2> /dev/null
elif which gnome-open > /dev/null
then
	gnome-open http://weather.yahoo.com/ 2> /dev/null
fi
echo "http://weather.yahoo.com/"
echo ""
echo "Enter your city weather code:"
read WeatherCode
sed -i -e "s/44418/$WeatherCode/g" "$HOME/.conkyrc"
echo "Weather code added"
echo ""
clear
echo "System is Updating fonts ..."
echo "System needs permissions to update fonts cache."
sleep 1
sudo fc-cache -fv
echo ""
clear
echo ".........................................."
echo ""
echo "If you made any mistake then repeat process, if not then just move on"
sleep 3
clear
echo "Logout and login back."
echo "For more visit on site - http://www.NoobsLab.com"
rm $HOME/.spectro-conky.sh 2> /dev/null
