#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar
PKG_VERSION:=v0.83.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/sugar
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS:= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS:= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/sugar
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=Sugar Desktop Environment
  DEPENDS:=+sugar-base +sugar-toolkit +sugar-presence-service +sugar-datastore \
  +sugar-artwork +libgconf2 +python-cjson
#  DEPENDS:=+sugar-artwork +sugar-base +sugar-toolkit +sugar-presence-service +sugar-datastore +telepathy-python +pycairo +numpy +gst-python +dbus-python +python-gtk +python-gobject +python-gnome-desktop
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); mkdir m4; intltoolize --force; autoreconf --install -v);
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/mk
	$(INSTALL_DATA) \
	    ./files/sugar-activity-package.mk \
	    $(1)/mk/
endef

define Package/sugar/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar))
