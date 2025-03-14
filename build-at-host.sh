#!/bin/bash

run_script() {
    local script_path="$1"

    # 保存当前目录
    pushd . > /dev/null

    # 执行传入的脚本
    if [[ -f "$script_path" ]]; then
        bash "$script_path"
    else
        echo "Error: Script '$script_path' not found."
    fi

    # 恢复原始目录
    popd > /dev/null
}

mkdir -p /root/.config/clangd
cp config.yaml /root/.config/clangd
run_script build.sh

# zsh and tmux
cp .zshrc.tmp /root/.zshrc.tmp
cp .tmux.conf.tmp /root/.tmux.conf.tmp
cp .tmux.conf.local.tmp /root/.tmux.conf.local.tmp
run_script build-dev-tools.sh

# emacs
run_script build-emacs.sh

# python
run_script build-python.sh

# rust
run_script build-rust.sh

# doom eamcs
cp *.el /root/
run_script build-doom.sh
