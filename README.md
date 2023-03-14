# local_manifests

## Personal local manifest for my LineageOS builds

> :warning: I won't give support to **buildbot** LineageOS. **Be very careful!**

```bash
## Sync
LOS_VERSION=20.0 # 19.1 , 20.0
LOS_VERSION_SHORT=20 # 19 , 20
# Init LineageOS repos
repo init -u https://github.com/LineageOS/android.git --depth=1 -b lineage-${LOS_VERSION} --git-lfs
# Resync webview
rm -rf external/chromium-webview/prebuilt/*  
rm -rf .repo/projects/external/chromium-webview/prebuilt/*.git
rm -rf .repo/project-objects/LineageOS/android_external_chromium-webview_prebuilt_*.git
# Add local_manifests
rm -rf .repo/local_manifests
mkdir -p .repo/local_manifests
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/lineage-${LOS_VERSION_SHORT}.xml -o .repo/local_manifests/lineage.xml
# Sync
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
repo forall external/chromium-webview/prebuilt/* -c "git lfs pull"

## Build
. build/envsetup.sh
lunch lineage_lisa-userdebug # lisa, daisy, ysl
mka bacon 
```

