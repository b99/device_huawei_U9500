Huawei U9500 Ascend D1 device tree for Cyanogemod 10.1.

Build script:

#!/bin/bash

export USE_CCACHE=1
export CCACHE_DIR=~/.ccache/cm10.1-front

if [ ! -d "$CCACHE_DIR" ]; then
    mkdir "$CCACHE_DIR"
fi

# Set ccache 50GB
./prebuilts/misc/linux-x86/ccache/ccache -M 10G

mypath=`pwd`

# Get prebuilts
cd ./vendor/cm/
./get-prebuilts
cd $mypath

# Compiling
. build/envsetup.sh
breakfast front
brunch front
