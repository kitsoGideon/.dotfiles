#! /bin/bash

# For the development version of cython, use the following command instead
pip3 install git+https://github.com/cython/cython.git@master
#pip install Cython==0.23

# For the development version of Kivy, use the following command instead
pip3 install git+https://github.com/kivy/kivy.git@master

# Install development version of buildozer into the virtualenv
pip3 install git+https://github.com/kivy/buildozer.git@master

# Install development version of plyer into the virtualenv
pip3 install git+https://github.com/kivy/plyer.git@master

# Install a couple of dependencies for KivyCatalog
pip3 install -U pygments docutils
