#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-terminal-activity
PKG_VERSION:=v20
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/projects/terminal-activity
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sugar-terminal-activity
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Terminal activity for the sugar desktop environment
  DEPENDS:=+python-vte
endef

define Build/Compile
    $(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/share/activities/Terminal.activity/
	$(CP) $(PKG_BUILD_DIR)/icons/ $(PKG_BUILD_DIR)/activity/ $(PKG_BUILD_DIR)/*.py $(PKG_INSTALL_DIR)/usr/share/activities/Terminal.activity/
endef

define Package/sugar-terminal-activity/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-terminal-activity))
