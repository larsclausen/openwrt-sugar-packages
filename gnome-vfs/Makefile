include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-vfs
PKG_VERSION:=2.22.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.22
#PKG_MD5SUM:=88b520e5de748a310a2aef62fc095c8
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

EXTRA_CFLAGS=-I$(STAGING_DIR)/usr/lib/libintl/include/ \
			 -I$(STAGING_DIR)/usr/lib/libiconv/include/
EXTRA_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
			   -L$(STAGING_DIR)/usr/lib/libintl/lib/ \
			   -L$(STAGING_DIR)/usr/lib/libiconv/lib/

define Package/gnome-vfs
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=lib
  TITLE:=gnome-vfs
  DEPENDS:=+glib2 +gconf
endef

define Build/Configure
  $(call Build/Configure/Default,--disable-mozilla-plugin)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR)/ install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/gnome-vfs/install
	cp -r $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,gnome-vfs))


