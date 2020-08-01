INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DontSwipe

DontSwipe_FILES = Listener.xm
DontSwipe_LIBRARIES = activator
DontSwipe_FRAMEWORKS = AudioToolbox

export ARCHS = arm64e
export SDKVERSION = 13.2
THEOS_DEVICE_IP = iPhone.local

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += dontswipe
include $(THEOS_MAKE_PATH)/aggregate.mk
