#!/bin/bash

ln -s /usr/bin/python3 /usr/bin/python
apt install -y python3-pip pipx
for package in black pyflakes isort pipenv nose pytest cmake-language-server compiledb; do
    pipx install $package
done
