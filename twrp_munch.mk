#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH=device/xiaomi/kona

# Inherit from munch device
$(call inherit-product, device/xiaomi/kona/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := munch

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := twrp_munch
PRODUCT_DEVICE := kona
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F4

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Kernel
KERNEL_PATH := $(DEVICE_PATH)/prebuilt/munch
TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img

# Unified Script
PRODUCT_COPY_FILES += $(DEVICE_PATH)/prebuilt/munch/unified-script.sh:$(TARGET_COPY_OUT_RECOVERY_ROOT)/system/bin/unified-script.sh