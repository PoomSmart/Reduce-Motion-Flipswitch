PACKAGE_VERSION = 1.0.0
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ReduceMotionFS
ReduceMotionFS_FILES = Switch.xm
ReduceMotionFS_FRAMEWORKS = UIKit
ReduceMotionFS_LIBRARIES = Accessibility flipswitch
ReduceMotionFS_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
