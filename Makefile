ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
	TARGET := iphone:clang:latest:15.0
else
	TARGET := iphone:clang:latest:12.2
endif


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RevengeTweak

RevengeTweak_FILES = $(shell find Sources/VendettaTweak -name '*.swift') $(shell find Sources/VendettaTweakC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
RevengeTweak_SWIFTFLAGS = -ISources/VendettaTweakC/include
RevengeTweak_CFLAGS = -fobjc-arc -ISources/VendettaTweakC/include

RevengeTweak_BUNDLE_NAME = RevengePatches
RevengeTweak_BUNDLE_RESOURCE_DIRS = RevengeXposed/App/src/main/assets/js Resources

include $(THEOS_MAKE_PATH)/tweak.mk
