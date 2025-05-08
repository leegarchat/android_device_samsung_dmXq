#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#




include device/samsung/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/dmXq/$(MY_DEVICE_TARGET_BUILD)

# Assert
TARGET_OTA_ASSERT_DEVICE := $(MY_DEVICE_TARGET_BUILD)

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
TARGET_KERNEL_CONFIG := $(MY_DEVICE_TARGET_BUILD)_defconfig

# Kernel Modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.system_dlkm))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.vendor_boot))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery $(DEVICE_PATH)/modules.include.vendor_ramdisk))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
SYSTEM_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/modules.include.system_dlkm))

TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/mm-drivers/hw_fence \
    qcom/opensource/mm-drivers/msm_ext_display \
    qcom/opensource/mm-drivers/sync_fence \
    qcom/opensource/audio-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/securemsm-kernel \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/eva-kernel \
    qcom/opensource/video-driver \
    qcom/opensource/graphics-kernel \
    qcom/opensource/wlan/platform \
    qcom/opensource/bt-kernel

ifeq  ($(MY_DEVICE_TARGET_BUILD),dm3q)
    TARGET_KERNEL_EXT_MODULES += qcom/opensource/wlan/qcacld-3.0/.kiwi_v2
else
    TARGET_KERNEL_EXT_MODULES += qcom/opensource/wlan/qcacld-3.0/.qca6490
endif

ifeq  ($(MY_DEVICE_TARGET_BUILD),dm3q)
    BOARD_SUPER_PARTITION_SIZE := 12392071168
else ifeq  ($(MY_DEVICE_TARGET_BUILD),dm2q)
    BOARD_SUPER_PARTITION_SIZE := 12100567040
else ifeq  ($(MY_DEVICE_TARGET_BUILD),dm1q)
    BOARD_SUPER_PARTITION_SIZE := 12266242048
endif


# Partitions
BOARD_SUPER_PARTITION_SIZE := 12266242048

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
# Include the proprietary files BoardConfig.
include vendor/samsung/$(MY_DEVICE_TARGET_BUILD)/BoardConfigVendor.mk