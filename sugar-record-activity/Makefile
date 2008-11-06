#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-record-activity
PKG_VERSION:=v59
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/activities/record
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sugar-record-activity
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Record activity for the sugar desktop environment
  DEPENDS:=+gst-plugins-good
endef

ACTIVITY_DIR:=/usr/share/activities/Record.activity

define Build/Compile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(PKG_BUILD_DIR)

	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)
	$(CP) $(PKG_BUILD_DIR)/activity/ $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/gfx/ $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/icons/ $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/*.py $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/*.so $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
endef

define Package/sugar-record-activity/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-record-activity))
