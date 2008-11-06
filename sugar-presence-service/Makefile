#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-presence-service
PKG_VERSION:=v0.83.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/projects/presence-service
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sugar-presence-service
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=sugar-presence-service Desktop Environment
endef

define Build/Configure
    (cd $(PKG_BUILD_DIR); autoreconf --install -v);
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Package/sugar-presence-service/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-presence-service))
