#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6375-common
-include device/realme/sm6375-common/BoardConfigCommon.mk

DEVICE_PATH := device/realme/oscar

# HIDL
ODM_MANIFEST_SKUS += nfc
ODM_MANIFEST_NFC_FILES := $(DEVICE_PATH)/manifest_nfc.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_oscar

# Inherit the proprietary files
-include vendor/realme/oscar/BoardConfigVendor.mk
