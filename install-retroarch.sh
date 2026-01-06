#!/bin/bash

if [ $UID != 0 ]; then
    echo "Script must be run as root"
    exit 1
fi

paru -Sy retroarch retroarch-assets-ozone --no-confirm

# Shaders - Need to change backend to Vulkan instead of gl
paru -Sy libretro-shaders-slang --no-confirm

# Cores
paru -Sy libretro-bsnes libretro-gambatte --no-confirm

# Enable gambatte shader
echo "shaders = 1

shader0 = shaders/color/gbc-gambatte-color.slang
filter_linear0 = false
scale_type_0 = source
scale0 = 1.0" > /usr/share/libretro/shaders/shaders_slang/handheld/gbc-gambatte-color.slangp
