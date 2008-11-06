#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-datastore
PKG_VERSION:=v0.83.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/projects/datastore
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/sugar-datastore
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=Sugar Desktop Environment
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); autoreconf -i;);
	$(call Build/Configure/Default)
endef

define Package/sugar-datastore/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-datastore))
