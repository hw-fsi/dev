#!/usr/bin/env bash
set -euo pipefail

VERSION=30.1
GCC_VERSION=13

apt install -y libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgnutls28-dev pkg-config fontconfig libjansson-dev libgccjit-$GCC_VERSION-dev fonts-emojione shfmt glslang-tools texinfo

cd && wget https://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.xz || exit
tar -xf emacs-$VERSION.tar.xz || exit
cd emacs-$VERSION || exit
export CC=gcc-$GCC_VERSION CXX=g++-$GCC_VERSION
./configure --with-gnutls --with-x-toolkit=no
make -j && make install

# clear
cd && rm emacs* -rf
