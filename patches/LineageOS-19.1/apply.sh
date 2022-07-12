#!/bin/bash

# .repo/local_manifests/patches

# frameworks
cp frameworks/base/0001-Add-support-for-app-signature-spoofing.patch ../../../../frameworks/base/
cp frameworks/base/0001-DozeSensors-Only-use-proximity-sensor-if-supported.patch ../../../../frameworks/base/
cd ../../../../frameworks/base/
git am 0001-Add-support-for-app-signature-spoofing.patch
git am 0001-DozeSensors-Only-use-proximity-sensor-if-supported.patch
cd ../../.repo/local_manifests/patches/LineageOS-19.1

# packages
cp packages/modules/Permission/0001-Utils-add-FAKE_PACKAGE_SIGNATURE-to-platform-permiss.patch ../../../../packages/modules/Permission
cd ../../../../packages/modules/Permission
git am 0001-Utils-add-FAKE_PACKAGE_SIGNATURE-to-platform-permiss.patch
