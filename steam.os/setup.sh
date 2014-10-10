#!/bin/bash

# Update the system and install wmctrl.
sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get install wmctrl

# Install Steam.
sudo apt-get -f install steam
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib

# Enable OpenBox.
sudo mv /usr/share/xsessions/openbox.desktop.dis /usr/share/xsessions/openbox.desktop

# Set OpenBox to be the default session.
sed -r -e "s/user-session=(.*)/user-session=OpenBox/" /etc/lightdm/lightdm.conf > /tmp/lightdm.conf
sudo cp /tmp/lightdm.conf /etc/lightdm/lightdm.conf
rm /tmp/lightdm.conf

# Set the OpenBox background to be black and XBMC to autostart.
mkdir -p $HOME/.config/openbox/ && \
	echo "export DISPLAY=:0" >> $HOME/.config/openbox/autostart.sh && \
	echo "xsetroot -solid black &" >> $HOME/.config/openbox/autostart.sh && \
	echo "/usr/bin/xbmc &" >> $HOME/.config/openbox/autostart.sh && \
	chmod +x $HOME/.config/openbox/autostart.sh

# Set up ALSA sound settings.
cat ./resources/.asoundrc >> $HOME/.asoundrc

# Set up right click context menu.
sudo apt-get install menu
cp ./resources/menu.xml $HOME/.config/openbox/menu.xml
cp ./resources/steam-bpm.sh $HOME/.config/openbox/steam-bpm.sh
chmod +x $HOME/.config/openbox/steam-bpm.sh
