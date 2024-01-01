#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6375-common
-include device/realme/sm6375-common/BoardConfigCommon.mk

DEVICE_PATH := device/realme/oscar

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_oscar

# OTA assert
TARGET_OTA_ASSERT_DEVICE := RE54CBL1,RE547D

# Touch
SOONG_CONFIG_NAMESPACES += OPLUS_LINEAGE_TOUCH_HAL
SOONG_CONFIG_OPLUS_LINEAGE_TOUCH_HAL := INCLUDE_DIR
SOONG_CONFIG_OPLUS_LINEAGE_TOUCH_HAL_INCLUDE_DIR := \
    $(DEVICE_PATH)/touch/include

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit the proprietary files
-include vendor/realme/oscar/BoardConfigVendor.mk
