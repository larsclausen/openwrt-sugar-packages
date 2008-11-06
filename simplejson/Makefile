# 
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=simplejson
PKG_VERSION:=1.9.2
PKG_RELEASE:=1

PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/s/simplejson/
PGK_SOURCE_MD5:=9fe5d9a98da5ffc347bfee2ccf386fcb

include $(INCLUDE_DIR)/package.mk

define Package/simplejson
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=simplejson
  DEPENDS:=python
endef

define Build/Configure
endef

HOST_PYTHON:=python

define Build/Compile
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages
	(cd $(PKG_BUILD_DIR); PYTHONPATH=$(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages $(CONFIGURE_VARS) $(MAKE_VARS) $(HOST_PYTHON) ./setup.py install --prefix="$(PKG_INSTALL_DIR)/usr");
endef

define Package/simplejson/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,simplejson))
