# Copyright (C) 2023 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq (aospa_RMX2020,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/realme/RMX2020/device.mk)

# Inherit from the AOSPA configuration.
# device/qcom/common needs this during product config, before BoardConfig is loaded
TARGET_BOARD_PLATFORM := mt6768

$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 720
TARGET_SUPPORT_FACE_UNLOCK := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# Device identifier
PRODUCT_BRAND := realme
PRODUCT_DEVICE := RMX2020
PRODUCT_MANUFACTURER := realme
PRODUCT_MODEL := RMX2020
PRODUCT_NAME := aospa_RMX2020

PRODUCT_SYSTEM_DEVICE := RMX2020
PRODUCT_SYSTEM_MODEL := RMX2020
PRODUCT_SYSTEM_NAME := RMX2020

PRODUCT_GMS_CLIENTID_BASE := android-oppo

endif

# MTK device: hide Qualcomm common Android.bp files from soong
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/common
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/data-ipa-cfg-mgr
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/data-ipa-cfg-mgr-legacy
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/dataservices
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/libvmmem
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/recovery-ext
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/thermal-hal
PRODUCT_SOURCE_ROOT_DIRS += -hardware/qcom/bootctrl

# Use AOSP WebView instead of GMS Trichrome WebView
PRODUCT_PACKAGES := $(filter-out WebViewGoogle64,$(PRODUCT_PACKAGES))
PRODUCT_PACKAGES += webview

# Face unlock (AOSPA Sense)
PRODUCT_PACKAGES += FaceUnlock FaceUnlockOverlay vendor.aospa.biometrics.face.required
