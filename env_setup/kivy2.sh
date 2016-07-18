#! /bin/bash

# For the development version of cython, use the following command instead
pip install git+https://github.com/cython/cython.git@master

# For the development version of Kivy, use the following command instead
pip install git+https://github.com/kivy/kivy.git@master

# Install development version of buildozer into the virtualenv
pip install git+https://github.com/kivy/buildozer.git@master

# Install development version of plyer into the virtualenv
pip install git+https://github.com/kivy/plyer.git@master

# Install a couple of dependencies for KivyCatalog
pip install -U pygments docutils
