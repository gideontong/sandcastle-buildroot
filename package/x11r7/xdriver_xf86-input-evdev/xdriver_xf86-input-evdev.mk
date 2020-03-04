################################################################################
#
# xdriver_xf86-input-evdev
#
################################################################################

XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.6
XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES

XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
	host-pkgconf \
	libevdev \
	mtdev \
	xorgproto \
	xserver_xorg-server \

# autoreconf required because of patched configure.ac, see
# xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch
XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_UDEV),y)
XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES += udev
endif


$(eval $(autotools-package))
