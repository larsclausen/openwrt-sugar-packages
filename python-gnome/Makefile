#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 12821 2008-10-02 15:33:26Z lars $

include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-python
PKG_VERSION:=2.22.3
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.22
PKG_MD5SUM:=ab12d94954a57de39b25eb7903d8429c
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk
include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

PKG_INSTALL=1

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include \

TARGET_LDFLAGS += \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(call confvar,CONFIG_PACKAGE_python-gconf)

define Package/python-gnome/Default
  SECTION:=lang
  SUBMENU:=Python
  CATEGORY:=Languages
  TITLE:=$(1) python bindings
  URL:=http://ftp.gnome.org/
  DEPENDS:=python-core $(2)
endef

define Package/python-gconf
	$(call Package/python-gnome/Default,gconf,+libgconf2)
endef

define Build/Configure
	$(call Build/Configure/Default, \
	    --disable-allbindings \
	    $(if $(CONFIG_PACKAGE_python-gconf), --enable-gconf, --disable-gconf), \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/pygtk/2.0/defs
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pygtk/2.0/defs/* \
		$(1)/usr/share/pygtk/2.0/defs

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig

	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/*.{so,la} \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0
endef

define Package/python-gnome/install/Default
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/$(2).{so,a} \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0
endef

define Package/python-gconf/install
	$(call Package/python-gnome/install/Default,$(1),gconf)
endef

$(eval $(call BuildPackage,python-gconf))

