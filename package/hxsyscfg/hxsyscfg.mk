################################################################################
#
# hxsyscfg
#
################################################################################

HXSYSCFG_VERSION = 1.2
HXSYSCFG_SOURCE = hxsyscfg12tar.gz
HXSYSCFG_SITE = https://projectsandcastle.org/s
HXSYSCFG_LICENSE = GPL-2.0
HXSYSCFG_LICENSE_FILES = LICENSE

HXSYSCFG_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config"

define HXSYSCFG_BUILD_CMDS
	$(HXSYSCFG_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define HXSYSCFG_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/syscfg $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
