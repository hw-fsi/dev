#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt update && apt install -y libreadline-dev bison flex libprotobuf-dev protobuf-compiler libgflags-dev libgoogle-glog-dev libleveldb-dev libssl-dev libthrift-dev libpq-dev libfuse-dev libzookeeper-mt-dev libfmt-dev

# brpc
apt install -y libgflags-dev libssl-dev libsnappy-dev libgoogle-glog-dev libprotoc-dev libgoogle-perftools-dev libunwind-dev
