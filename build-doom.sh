#!/usr/bin/env bash
set -euo pipefail

DOOM_BIN=~/.config/emacs/bin/doom
DOOM_CONF_DIR=~/.config/doom

# doom emacs
mkdir $DOOM_CONF_DIR -p
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.config/emacs
sed -i '129s|:repo "https://git.savannah.gnu.org/git/emacs/nongnu.git"|:repo "https://github.com/emacsmirror/nongnu_elpa.git"|' ~/.config/emacs/lisp/lib/packages.el

$DOOM_BIN env
$DOOM_BIN install
cp ~/*.el $DOOM_CONF_DIR
$DOOM_BIN sync -j 64

# doom doctor
apt install -y markdown shellcheck ispell

# clear
cd && rm ./*.el -rf
