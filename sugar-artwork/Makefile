#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-artwork
PKG_VERSION:=v0.83.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/artwork
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=icon-naming-utils


include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

define Package/sugar-artwork
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=sugar-artwork Desktop Environment
  DEPENDS:=+gtk2
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); autoreconf -i);
	$(call Build/Configure/Default)
endef

define Package/sugar-artwork/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-artwork))
$(eval $(call RequireCommand,icon-slicer, \
    $(PKG_NAME) requires icon-slicer installed on the host-system. \
    http://www.freedesktop.org/wiki/Software/icon-slicer \
))
