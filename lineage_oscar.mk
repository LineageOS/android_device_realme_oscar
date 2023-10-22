#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from oscar device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_oscar
PRODUCT_DEVICE := oscar
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3471
PRODUCT_MANUFACTURER := realme

PRODUCT_SYSTEM_NAME := RE54CBL1
PRODUCT_SYSTEM_DEVICE := RE54CBL1

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RE54CBL1-user 13 TP1A.220905.001 S.136e0c0-a729-11edb4 release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_NAME) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

# Build fingerprint
BUILD_FINGERPRINT := "realme/RMX3471/RE54CBL1:13/TP1A.220905.001/S.136e0c0-a729-11edb4:user/release-keys"
