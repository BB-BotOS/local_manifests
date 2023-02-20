#!/bin/bash

# Build script for my build "for personal usage only"

devices=(
    "lisa"
    "daisy"
    "ysl"
)

## Sync
LOS_VERSION=20.0
LOS_VERSION_SHORT=20
# Init LineageOS repos
repo init -u https://github.com/LineageOS/android.git --depth=1 -b lineage-${LOS_VERSION}
# Add local_manifests
rm -rf .repo/local_manifests
mkdir -p .repo/local_manifests
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/lineage-${LOS_VERSION_SHORT}.xml -o .repo/local_manifests/lineage.xml
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/extra.xml -o .repo/local_manifests/extra.xml
# Sync
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune

## Build
# Init envsetup
. vendor/extra/build/envsetup.sh -p
# Build
for device in ${devices[@]}; do
    echo "Build for ${device}"
    sleep 3
    mka_build ${device} -r
done