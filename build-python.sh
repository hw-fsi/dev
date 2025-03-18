#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

ln -s /usr/bin/python3 /usr/bin/python
apt install -y python3-pip pipx
pip install --upgrade argcomplete
pip install black pyflakes isort pipenv nose pytest cmake-language-server compiledb
