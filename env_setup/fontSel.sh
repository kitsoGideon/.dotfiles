#! /bin/bash

bash /etc/fonts/infinality/infctl.sh setstyle

sudo mv /etc/profile.d/infinality-settings.sh /etc/infinality-settings.sh
sudo chmod a+rx /etc/infinality-settings.sh


echo "#INFINALITY FONT RENDERING CONFIG" >> ~/.bashrc
echo "#INFINALITY FONT RENDERING CONFIG" >> ~/.zshrc


echo "/etc/infinality-settings.sh" >> ~/.bashrc
echo "/etc/infinality-settings.sh" >> ~/.zshrc

apt-get install fonts-cantarell lmodern ttf-aenigma ttf-georgewilliams
apt-get install ttf-bitstream-vera ttf-sjfonts ttf-tuffy tv-fonts  
apt-get install ttf-mscorefonts-installer ttf-ancient-fonts package
apt-get install emojione-picker
