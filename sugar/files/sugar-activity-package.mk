#
# Copyright (C) 2006-2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PKG_SUGAR_ACTIVITY_DIR:=/usr/share/sugar/activities/

define Build/SugarActivity/Configure/Default
	$(call Build/Configure/Default)
endef

define Build/Configure
	$(call Build/SugarActivity/Configure/Default)
endef

define Build/SugarActivity/Compile/foo
	echo MUH $(1)
	if [ -f $(PKG_BUILD_DIR)/Makefile ]; then \
		$(MAKE) -C $(PKG_BUILD_DIR); \
	fi
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/$(1)

	if [ -f $(PKG_BUILD_DIR)/MANIFEST ]; then \
		for file in `cat $(PKG_BUILD_DIR)/MANIFEST`; do \
			dir=`dirname $$$$file`; \
			if [ $$$${dir:0:2} != "po" ]; then \
			if [ $$$${dir:0:6} != "locale" ]; then \
				dir=$(PKG_INSTALL_DIR)/$(1)/$$$$dir; \
				if [ ! -d $$$$dir ]; then \
					$(INSTALL_DIR) $$$$dir || exit 1; \
				fi; \
				$(CP) $(PKG_BUILD_DIR)/$$$$file $(PKG_INSTALL_DIR)/$(1)/$$$$file || exit 1; \
			fi;fi; \
		done; \
	else \
		if [ -d $(PKG_BUILD_DIR)/activity ]; then \
			$(CP) $(PKG_BUILD_DIR)/activity $(PKG_INSTALL_DIR)/$(1) || exit 1; \
		fi; \
		if [ -d $(PKG_BUILD_DIR)/icons ]; then \
			$(CP) $(PKG_BUILD_DIR)/icons $(PKG_INSTALL_DIR)/$(1) || exit 1;\
		fi; \
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.py $(PKG_INSTALL_DIR)/$(1) || exit 1; \
	fi
endef

define Build/SugarActivity/Compile/Default
	$(call Build/SugarActivity/Compile/foo,$(PKG_SUGAR_ACTIVITY_DIR)$(if $(strip $(PKG_SUGAR_ACTIVITY_NAME)),$(PKG_SUGAR_ACTIVITY_NAME),$(strip $(shell if [ -f $(PKG_BUILD_DIR)/activity/activity.info ]; then \
	    grep name $(PKG_BUILD_DIR)/activity/activity.info | cut -d "=" -f 2; \
	    fi)).activity))
endef

define Build/Compile/Default
	$(call Build/SugarActivity/Compile/Default)
endef

define SugarActivity/install/Default
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef
