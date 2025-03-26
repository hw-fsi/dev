#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# base
apt update
apt install -y build-essential apt-utils git zsh vim tmux curl wget libssl-dev ack-grep rsync ccache clang clang-format clangd clang-tidy software-properties-common python3 net-tools gdb

# gcc-13
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt update
apt -y install gcc-13 g++-13
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 60 --slave /usr/bin/g++ g++ /usr/bin/g++-13
update-alternatives --set gcc /usr/bin/gcc-13

# locale
apt update
apt -y install locales tzdata
locale-gen en_US.UTF-8
echo "LANG=en_US.UTF-8" >>/etc/default/locale
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

# git
git config --global merge.conflictstyle diff3
