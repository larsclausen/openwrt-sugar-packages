include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-mime-data
PKG_VERSION:=2.18.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.18
#PKG_MD5SUM:=88b520e5de748a310a2aef62fc095c8
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include/
EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib/libintl/lib/

define Package/gnome-mime-data
  SECTION:=xorg-data
  CATEGORY:=Xorg
  SUBMENU:=Data
  TITLE:=gnome-mime-data
#  DEPENDS:=+glib2
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR="$(PKG_INSTALL_DIR)"
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/lib
	mv $(PKG_INSTALL_DIR)/usr/share/pkgconfig $(PKG_INSTALL_DIR)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gnome-mime-data/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gnome-mime-data))


