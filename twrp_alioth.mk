#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2021-2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Release name
PRODUCT_RELEASE_NAME := alioth

DEVICE_PATH=device/xiaomi/mikona

# Inherit from mikona device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit any OrangeFox-specific settings
$(call inherit-product-if-exists, $(DEVICE_PATH)/fox_mikona.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_DEVICE := mikona
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F3

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
#
