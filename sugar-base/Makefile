#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-base
PKG_VERSION:=v0.83.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/sugar-base
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS:= \
	-I$(STAGING_DIR)/usr/include/pygtk-2.0 \
	-I$(STAGIN_DIR)/usr/include/glib-2.0 \
	-I$(STAGING_DIR)/usr/lib/glib-2.0/include \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS:= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-L$(STAGING_DIR)/usr/lib -lglib-2.0 -lintl -liconv

define Package/sugar-base
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=sugar-base Desktop Environment
#  DEPENDS:=+python-wnck
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); intltoolize; autoreconf --install -v);
	$(call Build/Configure/Default)
endef

define Package/sugar-base/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-base))
