include $(TOPDIR)/rules.mk

PKG_NAME:=hal
PKG_VERSION:=0.5.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://hal.freedesktop.org/releases/
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

define Package/hal
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Linux Hardware Abstraction Layer
  URL:=http://freedesktop.org/wiki/Software/hal
  DEPENDS:=+dbus +udev +udevextras +libusb +pciutils +libdbus-glib +@UDEVEXTRAS_volume_id
endef

define Package/hal/description
HAL is a hardware abstraction layer.
endef

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/lib/libiconv/include
TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

define Build/Configure
	$(call Build/Configure/Default,\
	--with-hwdata=/usr/share/ \
		--disable-policy-kit \
		--with-hal-group=root \
		--with-hal-user=daemon \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,la} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/include/hal/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/include/hal/* $(1)/usr/include/hal/
endef

define Package/hal/install
	$(INSTALL_DIR) $(1)/etc/
	$(CP) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/hal/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/hal/* $(1)/usr/share/hal/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/*.{so*,a} $(1)/usr/lib/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/{hald,hal}-* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/hal/scripts/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/hal/scripts/hal-* $(1)/usr/lib/hal/scripts/
	$(INSTALL_DIR) $(1)/usr/lib/hal/scripts/linux/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/hal/scripts/linux/* $(1)/usr/lib/hal/scripts/linux/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/hald.init $(1)/etc/init.d/hald
endef

$(eval $(call BuildPackage,hal))


