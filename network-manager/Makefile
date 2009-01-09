include $(TOPDIR)/rules.mk

PKG_NAME:=NetworkManager
PKG_VERSION:=0.7.0-rc2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.7/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-0.7.0

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/network-manager
  SECTION:=xorg-apps
  CATEGORY:=Xorg
  SUBMENU:=app
  TITLE:=Network Manager
  URL:=http://network-manager.sourceforge.net/
  DEPENDS:=+wireless-tools +hal +libnl +libgcrypt +libiw +libuuid +libgnutls
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-crypto=gnutls \
		--with-distro=debian \
  		--without-gnome \
		--with-ip=/bin/ip \
	)
endef

define Package/network-manager/install
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,network-manager))


