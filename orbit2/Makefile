include $(TOPDIR)/rules.mk

PKG_NAME:=orbit2
PKG_VERSION:=2.14.16
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/ORBit2-$(PKG_VERSION)
PKG_SOURCE:=ORBit2-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNOME/ORBit2/2.14
#PKG_MD5SUM:=d7fb9eb41e8196f1aacf2f08375ae555
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

PKG_INSTALL=1

EXTRA_CFLAGS+= \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/libiconv/include

EXTRA_LDFLAGS+= \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib

BIGENDIAN=no
ifeq ($(CONFIG_BIG_ENDIAN),y)
	BIGENDIAN:=yes
endif

CONFIGURE_VARS += \
	ac_cv_c_bigendian=$(BIGENDIAN) \
	ac_cv_alignof_CORBA_octet=1 \
	ac_cv_alignof_CORBA_boolean=1 \
	ac_cv_alignof_CORBA_char=1 \
	ac_cv_alignof_CORBA_wchar=2 \
	ac_cv_alignof_CORBA_short=2 \
	ac_cv_alignof_CORBA_long=4 \
	ac_cv_alignof_CORBA_long_long=4 \
	ac_cv_alignof_CORBA_float=4 \
	ac_cv_alignof_CORBA_double=4 \
	ac_cv_alignof_CORBA_long_double=4 \
	ac_cv_alignof_CORBA_struct=1 \
	ac_cv_alignof_CORBA_pointer=4

define Package/orbit2
  SECTION:=xorg-framework
  CATEGORY:=Xorg
  SUBMENU:=lib
  TITLE:=ORBit2
  URL:=http://www.gnome.org/projects/ORBit2/
  DEPENDS:=+glib2 +libIDL2
endef

define Package/orbit2/description
ORBit2 is a CORBA 2.4-compliant Object Request Broker (ORB).
endef

define Build/Configure
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)
	( cd $(PKG_BUILD_DIR); CONFIG_SITE= \
		PKG_CONFIG=/usr/bin/pkg-config \
		PKG_CONFIG_PATH= \
		PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig \
		./configure \
		--target=$(GNU_HOST_NAME) \
		--host=$(GNU_HOST_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=$(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME) \
		--disable-shared \
		--enable-static \
		--enable-debug=no \
	);
	$(MAKE) -C $(PKG_BUILD_DIR)/src/idl-compiler install clean
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{include/orbit-2.0,lib/pkgconfig}

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so*,la} \
		$(1)/usr/lib/

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(SED) \
		's,orbit_idl=.*,orbit_idl=$(STAGING_DIR)/host/bin/orbit-idl-2,g' \
		$(1)/usr/lib/pkgconfig/ORBit-2.0.pc

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/orbit-2.0/* \
		$(1)/usr/include/orbit-2.0/

	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/orbit2-config \
		$(2)/bin/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/build/$(GNU_HOST_NAME)/bin/orbit-idl-2 \
		$(2)/bin/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) \
	    $(PKG_INSTALL_DIR)/usr/share/aclocal/* \
	    $(1)/usr/share/aclocal/

	$(INSTALL_DIR) $(1)/usr/share/idl/orbit-2.0
	$(INSTALL_DATA) \
	    $(PKG_INSTALL_DIR)/usr/share/idl/orbit-2.0/* \
	    $(1)/usr/share/idl/orbit-2.0/
endef

define Package/orbit2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libORBit*.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,orbit2))
