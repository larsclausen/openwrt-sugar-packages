include $(TOPDIR)/rules.mk

PKG_NAME:=gnome-vfs
PKG_VERSION:=2.24.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/2.24
#PKG_MD5SUM:=
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL:=1

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
  DEPENDS:=+glib2 +libgconf2 +bzip2 +gnome-mime-data
endef

define Package/gnome-vfs-utils
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/gnome-vfs-2.0 \
		--disable-mozilla-plugin \
		--disable-openssl \
		--disable-howl \
		--disable-avahi \
		--disable-samba \
		--disable-selinux \
		--disable-fam \
		--disable-ipv6 \
		--disable-hal \
		--disable-http-debug \
		--disable-cdda \
		--disable-gnutls \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/gnome-vfs-2.0/libgnomevfs
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gnome-vfs-2.0/libgnomevfs/*.h \
		$(1)/usr/include/gnome-vfs-2.0/libgnomevfs/

	$(INSTALL_DIR) $(1)/usr/include/gnome-vfs-module-2.0/libgnomevfs
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/gnome-vfs-module-2.0/libgnomevfs/*.h \
		$(1)/usr/include/gnome-vfs-module-2.0/libgnomevfs/

	$(INSTALL_DIR) $(1)/usr/lib/{pkgconfig,gnome-vfs-2.0/include}
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgnomevfs-2.{so*,a,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/gnome-vfs-2.0/include/*.h \
		$(1)/usr/lib/gnome-vfs-2.0/include/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
endef

define Package/gnome-vfs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgnomevfs-2.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/gnome-vfs-2.0
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/gnome-vfs-2.0/gnome-vfs-daemon \
		$(1)/usr/lib/gnome-vfs-2.0/

	$(INSTALL_DIR) $(1)/usr/share/dbus-1/services
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/dbus-1/services/* \
		$(1)/usr/share/dbus-1/services/
endef

$(eval $(call BuildPackage,gnome-vfs))
