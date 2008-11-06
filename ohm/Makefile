# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ohm
PKG_VERSION:=HEAD
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://dev.laptop.org/projects/$(PKG_NAME)/
#PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include \
              -I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/libintl/lib \
				-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/ohm
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=framework
  TITLE:=ohm Desktop Environment
  DEPENDS:=hal
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)/m4
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); NOCONFIGURE=1 ./autogen.sh);
	$(call Build/Configure/Default,--with-distro=none --without-xauth)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Package/ohm/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,ohm))
