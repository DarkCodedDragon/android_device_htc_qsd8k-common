LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_BOARD_PLATFORM),qsd8k)

LOCAL_MODULE_TAGS      := optional
LOCAL_MODULE_PATH      := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE           := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_SRC_FILES        := cameraHal.cpp

LOCAL_SHARED_LIBRARIES := liblog libutils libcamera_client libbinder \
                          libcutils libhardware libcamera

LOCAL_C_INCLUDES       := frameworks/base/services \
                          frameworks/base/include \
                          hardware/libhardware/include \
                          hardware/qcom/display/libgralloc

LOCAL_PRELINK_MODULE   := false

ifeq ($(TARGET_USE_CAF_PARAMS), true)
    LOCAL_CFLAGS += -DCAF_PARAMS
endif

include $(BUILD_SHARED_LIBRARY)

endif
