include $(TOPDIR)/rules.mk

PKG_NAME:=NetworkManager
PKG_VERSION:=0.6.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/0.6/

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/lib/libintl/include
EXTRA_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Package/network-manager
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=lib
  TITLE:=Network Manager
  URL:=http://network-manager.sourceforge.net/
  DEPENDS:=+wireless-tools +hal +libnl +libgcrypt +libiw
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--with-distro=SUSE \
  		--without-gnome \
		--with-ip=/bin/ip \
	)
endef

define Package/network-manager/install
	mkdir -p $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,network-manager))


