#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-toolkit
PKG_VERSION:=v0.83.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/sugar-toolkit
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_FIXUP:=libtool

EXTRA_CFLAGS:= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libintl/include

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-lX11 -lXext

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/sugar-toolkit
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=Toolkit library for the sugar desktop environment
  DEPENDS:=+sugar-base +alsa-lib
#  DEPENDS:=+sugar-base +dbus-python +hippo-canvas +pycairo +python-json +python-gtk +python-gobject +python-gnome-desktop +telepathy-python 
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); intltoolize --force; autoreconf --install -v);
	$(call Build/Configure/Default)
endef

define Package/sugar-toolkit/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-toolkit))
