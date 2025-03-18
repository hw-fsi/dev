#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs
