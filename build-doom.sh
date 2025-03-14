#!/bin/bash

# doom emacs
mkdir ~/.config/doom -p
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.config/emacs
sed -i '129s|:repo "https://git.savannah.gnu.org/git/emacs/nongnu.git"|:repo "https://github.com/emacsmirror/nongnu_elpa.git"|' ~/.config/emacs/lisp/lib/packages.el

~/.config/emacs/bin/doom env
~/.config/emacs/bin/doom install
cp ~/*.el ~/.config/doom/
doom sync -j 64

# doom doctor
apt install -y markdown shellcheck ispell

# clear
cd && rm ./*.el -rf
