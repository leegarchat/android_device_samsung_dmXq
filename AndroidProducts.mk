#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_dm1q.mk \
    $(LOCAL_DIR)/lineage_dm2q.mk \
    $(LOCAL_DIR)/lineage_dm3q.mk 
    
COMMON_LUNCH_CHOICES := \
    lineage_dm1q-userdebug \
    lineage_dm2q-userdebug \
    lineage_dm3q-userdebug \
    lineage_dm1q-eng \
    lineage_dm2q-eng \
    lineage_dm3q-eng \
    lineage_dm1q-user \
    lineage_dm2q-user \
    lineage_dm3q-user 

