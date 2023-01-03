# local_manifests

## Local manifest for my projects

```bash
# Run these commands on source roodir
LOS_VERSION=$(grep "PRODUCT_VERSION_MAJOR" "$ANDROID_BUILD_TOP"/vendor/lineage/config/version.mk | sed 's/PRODUCT_VERSION_MAJOR = //g' | head -1)
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/lineage-${LOS_VERSION}.xml -o .repo/local_manifests/lineage.xml –create-dirs
curl https://gitlab.com/itsvixano-dev/local_manifests/-/raw/main/extra.xml -o .repo/local_manifests/extra.xml –create-dirs
```
