#!/bin/bash

# .repo/local_manifests/patches

# frameworks
cp frameworks/base/0001-Add-support-for-app-signature-spoofing.patch ../../../frameworks/base/
cd ../../../frameworks/base/
git am 0001-Add-support-for-app-signature-spoofing.patch
cd ../../.repo/local_manifests/patches

# packages
cp packages/apps/PermissionController/0001-Utils-add-FAKE_PACKAGE_SIGNATURE-to-platform-permiss.patch ../../../packages/apps/PermissionController/
cp packages/apps/Updater/0001-updater-Use-gh-releases-to-host-18-otas.patch ../../../packages/apps/Updater/
cd ../../../packages/apps/Updater/
git am 0001-updater-Use-gh-releases-to-host-18-otas.patch
cd ../PermissionController/
git am 0001-Utils-add-FAKE_PACKAGE_SIGNATURE-to-platform-permiss.patch
