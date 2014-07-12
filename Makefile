SDKVERSION = 7.0
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

BUNDLE_NAME = ReduceMotionToggle
ReduceMotionToggle_FILES = Switch.xm
ReduceMotionToggle_FRAMEWORKS = UIKit
ReduceMotionToggle_LIBRARIES = flipswitch
ReduceMotionToggle_INSTALL_PATH = /Library/Switches
ReduceMotionToggle_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk