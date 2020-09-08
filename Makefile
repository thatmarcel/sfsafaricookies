include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SFSafariCookies

SFSafariCookies_FILES = Tweak.xm
SFSafariCookies_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
