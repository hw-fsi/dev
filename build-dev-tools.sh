#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-/usr/local/lib64}"
CMAKE_VERSION=v3.31.6
CMAKE_TARGZ=cmake-$CMAKE_VERSION.tar.gz
CMAKE_HOME=CMake-${CMAKE_VERSION:1}

apt update

# cmake
cd && wget https://github.com/Kitware/CMake/archive/refs/tags/$CMAKE_VERSION.tar.gz -O $CMAKE_TARGZ
tar zxvf $CMAKE_TARGZ
cd $CMAKE_HOME || exit
./bootstrap --parallel=64
make -j && make install

# ninja
cd && git clone https://github.com/ninja-build/ninja.git && cd ninja || exit
git checkout release
python3 ./configure.py --bootstrap
cp ninja /usr/local/bin

# zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/.zshrc.tmp ~/.zshrc

# tmux
cd && git clone https://github.com/gpakosz/.tmux.git
cp .tmux.conf.tmp .tmux.conf && cp .tmux.conf.local.tmp .tmux.conf.local
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# clear
cd && rm $CMAKE_TARGZ $CMAKE_HOME ninja -rf
