include $(TOPDIR)/rules.mk

PKG_NAME:=icon-naming-utils
PKG_VERSION:=0.8.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://tango.freedesktop.org/releases/
#PKG_MD5SUM:=aae602677ce201b1a0ed6a0c18c207f2
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/icon-naming-utils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Tool for generation icon themes (Host only)
  URL:=http://tango.freedesktop.org/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/usr/lib/icon-naming-utils \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/icon-naming-utils
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/icon-naming-utils/icon-name-mapping \
		$(1)/usr/lib/icon-naming-utils/
	$(SED) \
		's,/usr/share/icon-naming-utils,$(STAGING_DIR)/usr/share/icon-naming-utils,g' \
		$(1)/usr/lib/icon-naming-utils/icon-name-mapping

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(SED) \
		's,^program_path=,program_path=$(STAGING_DIR),g' \
		$(1)/usr/lib/pkgconfig/icon-naming-utils.pc

	$(INSTALL_DIR) $(1)/usr/share/icon-naming-utils/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/icon-naming-utils/* \
		$(1)/usr/share/icon-naming-utils/
endef

define Package/icon-naming-utils/install
	true
endef

$(eval $(call BuildPackage,icon-naming-utils))


