# local_manifests

## Personal local manifest for my LineageOS builds

> :warning: I won't give support to **buildbot** LineageOS. **Be very careful!**

```bash
## Sync
# Init LineageOS repos
repo init -u https://github.com/LineageOS/android.git --depth=1 -b lineage-20.0 # lineage-20.0, lineage-19.1
# Add local_manifests
LOS_VERSION=20 # 20, 19
mkdir -p .repo/local_manifests
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/lineage-${LOS_VERSION}.xml -o .repo/local_manifests/lineage.xml
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/extra.xml -o .repo/local_manifests/extra.xml # For personal usage
# Sync
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune

## Build
. vendor/extra/build/envsetup.sh -p
mka_build lisa # lisa, daisy, ysl
```
