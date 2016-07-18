#! /bin/bash

# add a couple of awesome repos

# noobslab awesome repos
add-apt-repository -y ppa:noobslab/themes
add-apt-repository -y ppa:noobslab/app-dependencies
add-apt-repository -y ppa:nooobslab/apps
add-apt-repository -y ppa:noobslab/icons2
add-apt-repository -y ppa:noobslab/icons

# firefox repo
add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa

# neovim repo
add-apt-repository -y ppa:neovim-ppa/unstable

# git repo
add-apt-repository -y ppa:git-core/ppa

# deluge torrent client
add-apt-repository ppa:deluge-team/ppa

# GNU compiler collection
add-apt-repository -y ppa:ubuntu-toolchain-r/test

# the google chrome repository
#wget -q -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

