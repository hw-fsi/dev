#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

GCC_VERSION=13
CLANG_VERSION=19

# base
apt update
apt install -y build-essential apt-utils git zsh vim tmux curl wget libssl-dev ack-grep rsync ccache clang clangd clang-tidy clang-format software-properties-common python3 net-tools gdb

# clang-18
wget -qO- https://apt.llvm.org/llvm.sh | bash -s $CLANG_VERSION
apt install -y clang-$CLANG_VERSION clangd-$CLANG_VERSION clang-tidy-$CLANG_VERSION clang-format-$CLANG_VERSION

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$CLANG_VERSION 100
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-$CLANG_VERSION 100
update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-$CLANG_VERSION 100
update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-$CLANG_VERSION 100

# gcc-13
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt update
apt -y install gcc-$GCC_VERSION g++-$GCC_VERSION
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$GCC_VERSION 60 --slave /usr/bin/g++ g++ /usr/bin/g++-$GCC_VERSION
update-alternatives --set gcc /usr/bin/gcc-$GCC_VERSION

# locale
apt update
apt -y install locales tzdata
locale-gen en_US.UTF-8
echo "LANG=en_US.UTF-8" >>/etc/default/locale
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

# git
git config --global merge.conflictstyle diff3
