################################################################################
#
# hxutils
#
################################################################################

HXUTILS_VERSION = 1.0
HXUTILS_SITE = $(call github,corellium,projectsandcastle,master)
HXUTILS_LICENSE = GPL-2.0
HXUTILS_LICENSE_FILES = LICENSE

HXUTILS_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config"

define HXUTILS_BUILD_CMDS
	$(HXUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/syscfg/
	$(HXUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/hx-touchd/
	$(HXUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/hcdpack/
endef

define HXUTILS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/syscfg/syscfg $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/hx-touchd/hx-touchd $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/hcdpack/hcdpack $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
