#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=olpc-utils
PKG_VERSION:=v0.88
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/projects/$(PKG_NAME)/

include $(INCLUDE_DIR)/package.mk

define Package/olpc-utils
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=OLPC-specific binaries
  DEPENDS:=+libpam
endef

define Build/Configure
	rm $(PKG_BUILD_DIR)/Makefile
	ln -s $(PKG_BUILD_DIR)/Makefile.build $(PKG_BUILD_DIR)/Makefile
endef

MAKE_OPTS:=\
    $(TARGET_CONFIGURE_OPTS) \
	CFLAGS="-I$(STAGING_DIR)/usr/include/ $(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	LD="$(TARGET_CC)" \
    WARNFLAGS="-Wall -Werror -pedantic"

define Build/Compile
	$(MAKE_OPTS) $(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Package/olpc-utils/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/hal/
	$(CP) $(PKG_INSTALL_DIR)/etc/hal/* $(1)/etc/hal/
	$(INSTALL_DIR) $(1)/etc/X11/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/X11/xorg-dcon.conf $(1)/etc/X11/
	$(INSTALL_DIR) $(1)/etc/pam.d/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/pam.d/olpc-login $(1)/etc/pam.d/
endef

$(eval $(call BuildPackage,olpc-utils))
