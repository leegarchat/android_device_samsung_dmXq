#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#



# $(warning 1$(MY_DEVICE_TARGET_BUILD)) #dm1q/dm2q/dm3q

DEVICE_UNIFIED_PATH := device/samsung/dmXq
DEVICE_PATH := $(DEVICE_UNIFIED_PATH)/$(MY_DEVICE_TARGET_BUILD)


PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Init
PRODUCT_PACKAGES += \
    init.$(MY_DEVICE_TARGET_BUILD).rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

ifeq ($(PRODUCT_DEVICE),dm3q)
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/wlan
    PRODUCT_PACKAGES += \
        firmware_WCNSS_qcom_cfg.ini_symlink_dm3q \
        firmware_wlan_mac.bin_symlink_dm3q
else
    PRODUCT_PACKAGES += \
        firmware_WCNSS_qcom_cfg.ini_symlink_dm12q \
        firmware_wlan_mac.bin_symlink_dm12q
endif

# Overlays
PRODUCT_PACKAGES += \
    FrameworksRes_dmXq \
    LineageRes_dmXq \
    SystemUIRes_dmXq \
    FrameworksRes_$(MY_DEVICE_TARGET_BUILD) \
    SystemUIRes_$(MY_DEVICE_TARGET_BUILD) \
    WifiResTarget_$(MY_DEVICE_TARGET_BUILD)

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8550-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/samsung/dmXq/dmXq-vendor.mk)
