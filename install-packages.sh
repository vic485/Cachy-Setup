#!/bin/bash

if [ $UID != 0 ]; then
    echo "Script must be run as root"
    exit 1
fi

# Gaming
paru -S wine-cachyos winetricks steam lutris mangohud
