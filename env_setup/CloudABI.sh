#! bin/sh


apt install build-essential cmake ninja-build subversion
svn co https://llvm.org/svn/llvm-project/llvm/trunk llvm
svn co https://llvm.org/svn/llvm-project/cfe/trunk llvm/tools/clang
svn co https://llvm.org/svn/llvm-project/lld/trunk llvm/tools/lld
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/llvm-trunk ../llvm
ninja
sudo ninja install


for target in aarch64-unknown-cloudabi x86_64-unknown-cloudabi; do
  for tool in ar nm objdump ranlib size; do
    sudo ln -s ../llvm-trunk/bin/llvm-${tool} /usr/local/bin/${target}-${tool}
  done
  sudo ln -s ../llvm-trunk/bin/clang /usr/local/bin/${target}-cc
  sudo ln -s ../llvm-trunk/bin/clang /usr/local/bin/${target}-c++
  sudo ln -s ../llvm-trunk/bin/lld /usr/local/bin/${target}-ld
  sudo ln -s ../../${target} /usr/local/llvm-trunk/${target}
done

apt install apt-transport-https
echo deb https://nuxi.nl/distfiles/cloudabi-ports/debian/ cloudabi cloudabi | sudo tee /etc/apt/sources.list.d/cloudabi.list deb https://nuxi.nl/distfiles/cloudabi-ports/debian/ cloudabi cloudabi 
wget -qO - 'https://pgp.mit.edu/pks/lookup?op=get&search=0x0DA51B8531344B15' | sudo apt-key add - OK $ sudo apt-get update
apt install x86-64-unknown-cloudabi-cxx-runtime


apt install fakeroot git kernel-package
git clone https://github.com/NuxiNL/linux.git
