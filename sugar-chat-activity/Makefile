#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sugar-chat-activity
PKG_VERSION:=v60
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/chat-activity
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package-sugar-activity.mk

define Package/sugar-chat-activity
  SECTION:=xorg-app
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Chat activity for the sugar desktop environment
endef

define Package/sugar-chat-activity/install
	$(call SugarActivity/install/Default,$(1),$(2),$(3))
endef

$(eval $(call BuildPackage,sugar-chat-activity))
