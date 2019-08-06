# Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android_gdnative
LOCAL_CPPFLAGS := -std=c++14
LOCAL_CPP_FEATURES := rtti exceptions
LOCAL_LDLIBS := -llog

LOCAL_SRC_FILES := \
gdexample.cpp \
gdlibrary.cpp


LOCAL_C_INCLUDES := \
C:/MyGameDev/Godot/Games/gdnative_cpp_example/godot-cpp/godot_headers

include $(BUILD_SHARED_LIBRARY)
