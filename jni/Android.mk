# Android.mk
LOCAL_PATH := $(call my-dir)

# local static library

include $(CLEAR_VARS)
LOCAL_MODULE := libgodot-cpp
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../godot-cpp/bin/libgodot-cpp.android.debug.armv8.a
include $(PREBUILT_STATIC_LIBRARY)

# module
#
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
$(LOCAL_PATH)/../godot-cpp/include \
$(LOCAL_PATH)/../godot-cpp/include/core \
$(LOCAL_PATH)/../godot-cpp/include/gen \
$(LOCAL_PATH)/../godot-cpp/bin \
$(LOCAL_PATH)/../godot-cpp/godot_headers

LOCAL_MODULE := android_gdnative
LOCAL_CPPFLAGS := -std=c++11
LOCAL_CPP_FEATURES := rtti exceptions
LOCAL_LDLIBS := -llog

LOCAL_SRC_FILES := \
../src/gdexample.cpp \
../src/gdlibrary.cpp

LOCAL_STATIC_LIBRARIES := libgodot-cpp

include $(BUILD_SHARED_LIBRARY)
