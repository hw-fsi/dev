#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs
