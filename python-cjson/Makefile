#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-cjson
PKG_VERSION:=1.0.5
PKG_RELEASE:=1

PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/python-cjson/
PKG_MD5SUM:=4d55b66ecdf0300313af9d030d9644a3

include $(INCLUDE_DIR)/package.mk
-include $(if $(DUMP),,$(STAGING_DIR)/mk/python-package.mk)

define Package/python-cjson
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=A fast JSON encoder/decoder for Python written in C
	URL:=http://pypi.python.org/pypi/python-cjson
	DEPENDS:=python-core
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/python-cjson/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-cjson))
