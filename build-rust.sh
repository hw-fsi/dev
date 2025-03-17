#!/usr/bin/env bash

RUST_UP_BIN=~/.cargo/bin/rustup
CARGO_BIN=~/.cargo/bin/cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
$RUST_UP_BIN toolchain install nightly --allow-downgrade --profile minimal --component clippy
$RUST_UP_BIN component add rust-src

cd || exit
git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer || exit
$CARGO_BIN xtask install
$CARGO_BIN install fd-find

export DEBIAN_FRONTEND=noninteractive

cd || exit
git clone https://github.com/BurntSushi/ripgrep && cd ripgrep || exit
~/.cargo/bin/cargo build --release --features 'pcre2'
cp target/release/rg ~/.cargo/bin/rg

clear
cd && rm rust-analyzer ripgrep -rf
