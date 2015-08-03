#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013 ShevT
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

# vendor
$(call inherit-product-if-exists, vendor/huawei/front/front-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# overlay
DEVICE_PACKAGE_OVERLAYS += device/huawei/front/overlay

# Camera
PRODUCT_PACKAGES += \
    Camera

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.front:root/fstab.front \
    $(LOCAL_PATH)/ramdisk/init.front.rc:root/init.front.rc \
    $(LOCAL_PATH)/ramdisk/init.front.usb.rc:root/init.front.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.front.rc:root/ueventd.front.rc

# Media / Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/cm_front_audio_config.conf:system/etc/huawei/audio/cm_front_audio_config.conf \
    $(LOCAL_PATH)/configs/audio/cm_front_audio_config.conf:system/etc/huawei/audio/pac_front_audio_config.conf \
    $(LOCAL_PATH)/configs/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
    $(LOCAL_PATH)/configs/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/vold.fstab:system/etc/vold.fstab

# Key maps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(LOCAL_PATH)/configs/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(LOCAL_PATH)/configs/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
    $(LOCAL_PATH)/configs/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# Replace Bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bootanimation.zip:system/media/bootanimation.zip

# init.d
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.d/11frandom:system/etc/init.d/11frandom

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# Update timezones to 2015e
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/zoneinfo.dat:system/usr/share/zoneinfo/zoneinfo.dat \
    $(LOCAL_PATH)/prebuilt/zoneinfo.idx:system/usr/share/zoneinfo/zoneinfo.idx \
    $(LOCAL_PATH)/prebuilt/zoneinfo.version:system/usr/share/zoneinfo/zoneinfo.version

# Lights
PRODUCT_PACKAGES += \
    lights.omap4

PRODUCT_PACKAGES += \
    hwcomposer.front

# Audio Packages
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.a2dp.default \
    audio.r_submix.default \
    libtinyalsa \
    tinycap \
    tinymix \
    tinyplay \
    tinurec \
    libaudioutils

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs \
    libnetcmdiface \
    static_busybox

# Lib Skia test
PRODUCT_PACKAGES += \
    SkLibTiJpeg_Test

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# gralloc symlink
PRODUCT_PACKAGES += \
    gralloc.omap4.so

# Torch
PRODUCT_PACKAGES += \
    Torch

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Common
PRODUCT_PACKAGES += \
    l2ping \
    com.android.future.usb.accessory \
    mischelp \
    libinvensense_mpl \
    libstagefrighthw

# Utilities
PRODUCT_PACKAGES += \
    remount \
    optimizedb \
    optimizestorage

#Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heaputilization=0.75 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt

# Regional
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enterprise_mode=1 \
    ro.product.locale.language=ru \
    ro.product.locale.region=RU \
    ro.com.android.dateformat=dd-MM-yyyy \
    persist.sys.timezone=Europe/Moscow

# Default ringtones
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Plennica.mp3 \
    ro.config.notification_sound=Car_Lock.ogg \
    ro.config.alarm_alert=dream_is_over.ogg

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES := \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    persist.sys.usb.config=mtp \
    ro.adb.secure=0 \
    ro.debuggable=1

# Memory management
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Here crashes gallery
# if ro.build.display.id is such "cm_front-userdebug 4.2.2 JDQ39E eng.shev.20130805.153138 test-keys" then gellry crashshshsh
# as well - does not crash
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JDQ39E-ShevT

# This device is xhdpi
PRODUCT_CHARACTERISTICS      := default
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_TAGS                 += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG          := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG     := xhdpi
PRODUCT_LOCALES              += en_US xhdpi
