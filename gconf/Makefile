include $(TOPDIR)/rules.mk

PKG_NAME:=gconf
PKG_VERSION:=2.24.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.24
#PKG_MD5SUM:=c411bd6e9e25362ea613bb9a084be904
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/libiconv/include

EXTRA_LDFLAGS+= \
    -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/gconf
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=Libraries
  TITLE:=GConf
  URL:=http://www.gnome.org/projects/gconf/
  DEPENDS:=+orbit2 +glib2
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gconf/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gconf))


