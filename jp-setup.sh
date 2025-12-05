#!/bin/bash

if [ $UID != 0 ]; then
    echo "Script must be run as root"
    exit 1
fi

# Set proper jp keyboard and install mozc
localectl set-keymap jp106
paru -S fcitx5 fcitx5-mozc fcitx5-configtool
