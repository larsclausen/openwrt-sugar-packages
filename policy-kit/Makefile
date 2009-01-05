include $(TOPDIR)/rules.mk

PKG_NAME:=PolicyKit
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://hal.freedesktop.org/releases/
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/policy-kit
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Policy Kit
  URL:=http://freedesktop.org/wiki/Software/PolicyKit
  DEPENDS:=+libdbus-glib +udev +libpam
endef

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include

EXTRA_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Build/Configure
	$(call Build/Configure/Default, --with-os-type=OpenWRT \
		--with-polkit-user=daemon \
		--with-poolkit-group=root)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
endef

define Package/policy-kit/install
	$(INSTALL_DIR) $(1)/usr/share/dbus-1/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/dbus-1/* $(1)/usr/share/dbus-1/
	$(INSTALL_DIR) $(1)/usr/share/PolicyKit/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/PolicyKit/* $(1)/usr/share/PolicyKit/
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib/
	# Do we really need to copy alle these file?
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/polkit{d,-*} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,policy-kit))
