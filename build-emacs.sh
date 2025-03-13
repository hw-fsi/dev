#!/bin/bash

VERSION=30.1

apt install -y libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgnutls28-dev pkg-config fontconfig libjansson-dev libgccjit-11-dev fonts-emojione shfmt glslang-tools

cd && wget https://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.xz
tar -xf emacs-$VERSION.tar.xz && cd emacs-$VERSION || exit
./configure --with-native-compilation --with-gnutls --with-json --with-x-toolkit=no
make -j && make install

# clear
cd && rm emacs* -rf
