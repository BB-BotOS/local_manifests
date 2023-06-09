#!/bin/bash

# Build script for my build "for personal usage only"

#devices=(
#    "lisa"
#    "daisy"
#    "ysl"
#)

## Sync
#EOS_VERSION=v1-t
#EOS_VERSION_SHORT=v1-t

# Init LineageOS repos
repo init -u https://gitlab.e.foundation/e/os/releases.git --depth=1 -b v1-t
# Resync webview
#rm -rf external/chromium-webview/prebuilt/*
#rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
#rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git

# Add local_manifests
rm -rf .repo/local_manifests
mkdir -p .repo/local_manifests
curl https://github.com/BB-BotOS/local_manifests/-/raw/main/eos-v1-t.xml -o .repo/local_manifests/lineage.xml
#curl https://github.com/BB-BotOS/local_manifests/-/raw/main/extra.xml -o .repo/local_manifests/extra.xml

# Sync
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
#repo forall external/chromium-webview/prebuilt/* -c "git lfs pull"

## Build
# Init envsetup
. vendor/extra/build/envsetup.sh -p

# Build
#for device in ${devices[@]}; do
#    LOGI "Build for ${device}"
#    sleep 3
#    mka_build --device ${device} -r
#done


