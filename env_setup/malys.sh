#! /bin/bash

# source repos.sh here

# now lets update to get an updated list of apps, themes etc
apt-get update

# now lets first apply udates to our system
apt-get -y upgrade

### now lets install some stuff to be able to build some programs easily


# taken from tools needed to build nvim
apt-get install -y autoconf libtool libtool-bin aoutomake cmake g++ pkg-config unzip

# some other stuff

# some android stuff
apt-get install -y android-tools-adb qt4-qmake libqt4-dev libqtcore4 libqtgui4
#apt-get install -y qt5-qmake libqt5-dev libqtcore5 libqtgui5

# some themes

# finally some fun stuff

