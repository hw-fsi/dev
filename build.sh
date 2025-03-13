#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# base
apt update
apt install -y build-essential apt-utils git zsh vim tmux curl wget ack-grep rsync ccache clang clang-format clangd software-properties-common python3

# gcc-12
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt update
apt -y install gcc-12 g++-12
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 60 --slave /usr/bin/g++ g++ /usr/bin/g++-12
update-alternatives --set gcc /usr/bin/gcc-12

# locale
apt update
apt -y install locales tzdata
locale-gen en_US.UTF-8
echo "LANG=en_US.UTF-8" >> /etc/default/locale
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

# git
git config --global merge.conflictstyle diff3
