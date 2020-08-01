include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DontSwipe
DontSwipe_FILES = xxxRootListController.m
DontSwipe_INSTALL_PATH = /Library/PreferenceBundles
DontSwipe_PRIVATE_FRAMEWORKS = Preferences
DontSwipe_CFLAGS = -fobjc-arc

export ARCHS = arm64e
export SDKVERSION = 13.2
THEOS_DEVICE_IP = iPhone.local

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DontSwipe.plist$(ECHO_END)
