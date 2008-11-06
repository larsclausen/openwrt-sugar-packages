#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-read-activity
PKG_VERSION:=v60
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/projects/read-activity
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sugar-read-activity
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Read activity for the sugar desktop environment
endef

ACTIVITY_DIR:=/usr/share/activities/Read.activity

define Build/Compile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(PKG_BUILD_DIR)

	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)
	$(CP) $(PKG_BUILD_DIR)/activity/ $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/AUTHORS $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/NEWS $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
	$(CP) $(PKG_BUILD_DIR)/*.py $(PKG_INSTALL_DIR)/$(ACTIVITY_DIR)/
endef

define Package/sugar-read-activity/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,sugar-read-activity))
