#! /bin/bash

mkdir .gitClones
wget -o- https://toolbelt.heroku.com/install.sh | sh
apt-get install git curl python-pip zsh
\curl -sSL https://get.rvm.io | bash
wget --no-check-certificate http://instal.ohmyz.sh -O - | sh

