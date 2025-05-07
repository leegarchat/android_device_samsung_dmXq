#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

MY_DEVICE_TARGET_BUILD := dm1q
MY_DEVICE_NAME_CODE := S911B

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/samsung/dmXq/base_device.mk)

# Inherit from the Lineage configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
PRODUCT_NAME := evolutionx_$(MY_DEVICE_TARGET_BUILD)
PRODUCT_DEVICE := $(MY_DEVICE_TARGET_BUILD)
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-$(MY_DEVICE_NAME_CODE)
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="$(MY_DEVICE_TARGET_BUILD)xxx-user 15 AP3A.240905.015.A2 $(MY_DEVICE_NAME_CODE)XXU8DYD9 release-keys" \
    BuildFingerprint=samsung/$(MY_DEVICE_TARGET_BUILD)xxx/$(MY_DEVICE_TARGET_BUILD):15/AP3A.240905.015.A2/$(MY_DEVICE_NAME_CODE)XXU8DYD9:user/release-keys \
    DeviceProduct=$(MY_DEVICE_TARGET_BUILD)xxx \
    SystemName=$(MY_DEVICE_TARGET_BUILD)xxx    
WITH_GMS := true
TARGET_SUPPORTS_WALLEFFECT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_STOCK_AICORE := true
TARGET_INCLUDE_ACCORD := false
TARGET_HAS_UDFPS := true