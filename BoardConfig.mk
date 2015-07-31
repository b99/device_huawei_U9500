#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2014 ShevT
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
#

COMMON_FOLDER := device/huawei/front
VENDOR_DIR := vendor/huawei/front/proprietary

# inherit from omap4
-include hardware/ti/omap4/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/huawei/front/BoardConfigVendor.mk

# Camera
TI_CAMERAHAL_USES_LEGACY_DOMX_DCC := true
TI_CAMERAHAL_MAX_CAMERAS_SUPPORTED := 2
#TI_CAMERAHAL_DEBUG_ENABLED := true
USE_CAMERA_STUB := false

# We don't support cursor layers, which when attempting to use them,
# results in no cursors (mouse or otherwise) displayed on the screen.
TARGET_DISABLE_CURSOR_LAYER := true

# Platform
TARGET_BOARD_OMAP_CPU := 4460
TARGET_BOOTLOADER_BOARD_NAME := front
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_FPU_VARIANT := neon-fp16

USE_SET_METADATA := false

# Audio
BOARD_USES_GENERIC_AUDIO := false
MR0_AUDIO_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# FM
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# Kernel/Ramdisk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_KERNEL_CONFIG := front_defconfig
#TARGET_KERNEL_SOURCE := kernel/huawei/front
TARGET_PREBUILT_KERNEL := $(COMMON_FOLDER)/prebuilt/kernel

# EGL
BOARD_EGL_CFG := $(COMMON_FOLDER)/configs/egl.cfg
USE_OPENGL_RENDERER := true

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# PowerHAL
TARGET_PROVIDES_POWERHAL := true

# Use a small subset of system fonts to keep image size lower
SMALLER_FONT_FOOTPRINT := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_FOLDER)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(COMMON_FOLDER)/bluetooth/vnd_front.txt

# RIL
TARGET_PROVIDES_LIBRIL := $(VENDOR_DIR)/lib/libxgold-ril.so
BOARD_RIL_NO_CELLINFOLIST := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"

# fix this up by examining /proc/partitions on a running device. (value * 1024)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
# 6329204736 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6329188352
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
RECOVERY_CHARGEMODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"
TARGET_RECOVERY_INITRC := $(COMMON_FOLDER)/recovery/init.rc
TARGET_PREBUILT_RECOVERY_KERNEL := $(COMMON_FOLDER)/recovery/recovery_kernel
TARGET_RECOVERY_FSTAB := $(COMMON_FOLDER)/ramdisk/fstab.front
RECOVERY_FSTAB_VERSION := 2
TARGET_NO_SEPARATE_RECOVERY := true
