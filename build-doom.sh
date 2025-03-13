#!/bin/bash

# doom emacs
mkdir ~/.config/doom -p
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.config/emacs

~/.config/emacs/bin/doom install
cp ~/*.el ~/.config/doom/

# doom doctor
apt install -y shellcheck ispell

# clear
cd && rm ./*.el -rf
