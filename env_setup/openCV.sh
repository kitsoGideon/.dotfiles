#! /bin/sh

cd ~/PERSONAL_DEV/AssetBuilding/opencv-3.2.0/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/PERSONAL_DEV/AssetBuilding/opencv_contrib-3.2.0/modules \
    -D PYTHON_EXECUTABLE=~/.pyenv/versions/miniconda3-latest/bin/python3.6 \
    -D PYTHON_PACKAGES_PATH=~/.pyenv/versions/miniconda3-latest/lib/python3.6/site-packages \
    -D BUILD_EXAMPLES=ON ..
