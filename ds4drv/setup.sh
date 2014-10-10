#!/bin/bash

sudo apt-get install python2.7-dev python-setuptools python-pip blueman pyudev python-evdev
sudo pip install ds4drv

sudo cp ./config/ds4drv.conf /etc/ds4drv.conf
sudo cp ./init.d/ds4drv /etc/init.d/ds4drv
sudo update-rc.d ds4drv defaults
