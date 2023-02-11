#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH=device/xiaomi/kona

# Inherit from alioth device
$(call inherit-product, device/xiaomi/kona/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := alioth

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := twrp_alioth
PRODUCT_DEVICE := kona
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F3

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Kernel
# -----------------------------------------------------
KERNEL_PATH := $(DEVICE_PATH)/prebuilt/alioth

# whether to do an inline build of the kernel sources
ifeq ($(FOX_BUILD_FULL_KERNEL_SOURCES),1)
    TARGET_KERNEL_SOURCE := kernel/xiaomi/alioth
    TARGET_KERNEL_CONFIG := vendor/alioth-fox_defconfig
    TARGET_KERNEL_CLANG_COMPILE := true
    KERNEL_SUPPORTS_LLVM_TOOLS := true
    TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-
    # clang-r383902 = 11.0.1; clang-r416183b = 12.0.5; clang-r416183b1 = 12.0.7;
    # clang_13.0.0 (proton-clang 13.0.0, symlinked into prebuilts/clang/host/linux-x86/clang_13.0.0); clang-13+ is needed for Arrow-12.1 kernel sources
    TARGET_KERNEL_CLANG_VERSION := 13.0.0
    TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-$(TARGET_KERNEL_CLANG_VERSION)
    TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc
else
    TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/Image.gz-dtb
    BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
endif
# -----------------------------------------------------

# Unified Script
PRODUCT_COPY_FILES += $(DEVICE_PATH)/prebuilt/alioth/unified-script.sh:$(TARGET_COPY_OUT_RECOVERY_ROOT)/system/bin/unified-script.sh