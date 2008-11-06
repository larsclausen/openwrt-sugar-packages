include $(TOPDIR)/rules.mk

PKG_NAME:=xulrunner
PKG_VERSION:=1.9.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-source.tar.bz2
PKG_SOURCE_URL:=ftp://ftp.mozilla.org/pub/mozilla.org/$(PKG_NAME)/releases/$(PKG_VERSION)/source/
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=bzcat $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) $(TAR_OPTIONS) --transform "s,^mozilla/,,g"

TARGET_CFLAGS+= -m32 \
	-I/usr/lib/libintl/include \
	-I/usr/lib/libiconv/include

TARGET_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/ \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/ \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/libintl/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/libiconv/lib


define Package/xulrunner
  SECTION:=xorg-web
  CATEGORY:=Xorg
  SUBMENU:=Web
  TITLE:=xulrunner
  URL:=http://firefox.sourceforge.net/
  DEPENDS:=+gtk2 +libIDL2 +libstdcpp
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-application=xulrunner \
		--disable-javaxpcom \
		--disable-crashreporter \
		--disable-jemalloc \
		--x-includes="$(STAGING_DIR)/usr/include" \
		--x-libraries="$(STAGING_DIR)/usr/lib" \
		--without-system-png \
		--disable-tests \
		--disable-mochitest \
		--without-system-nspr \
		--enable-extensions=python \
		--enable-system-cairo \
		--enable-libxul \
		--disable-dbus \
		, \
		CROSS_COMPILE=1 \
		HOST_LIBIDL_CONFIG="./host-libIDL-config-2" \
		HOST_CC=$(HOSTCC) \
		HOST_CXX=gcc \
		HOST_RANLIB=ranlib \
		HOST_CFLAGS=-O2 \
		HOST_CXXFLAGS=-O2 \
		HOST_LDFLAGS=-L/usr/lib/ \
	)
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) ./host-libIDL-config-2 $(PKG_BUILD_DIR)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

define Package/xulrunner/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,xulrunner))


