# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# GApps
WITH_GAPPS := true
TARGET_GAPPS_ARCH := arm64
IS_PHONE := true
TARGET_SHIPS_SEPERATE_GAPPS_BUILD := true


# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Boot animation resolution
TARGET_BOOT_ANIMATION_RES := 2280

# Inherit some common AOSP-OMS stuff.
$(call inherit-product, vendor/aosp/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/zenfone6/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := zenfone6
PRODUCT_NAME := aosp_zenfone6
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_I01WD
PRODUCT_MANUFACTURER := asus

TARGET_DEVICE := WW_I01WD
PRODUCT_SYSTEM_DEVICE := ASUS_I01WD
PRODUCT_SYSTEM_NAME := WW_I01WD

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=ZS630KL \
    PRODUCT_NAME=WW_I01WD

VENDOR_RELEASE := 10/QP1A.190711.005/17.1810.2003.144-0:user/release-keys
BUILD_FINGERPRINT := asus/WW_I01WD/ASUS_I01WD:$(VENDOR_RELEASE)

PLATFORM_SECURITY_PATCH_OVERRIDE := 2020-03-01
