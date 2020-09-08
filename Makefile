include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SFCookies

SFCookies_FILES = Tweak.xm
SFCookies_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
