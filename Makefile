include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-v14tov15-helper
PKG_SOURCE_PROTO:=git
PKG_VERSION:=2
PKG_SOURCE_URL:=https://github.com/viisauksena/gluon-v14tov15-helper.git
PKG_SOURCE_DATE:=2018-04-14
PKG_SOURCE_VERSION:=6e2e7c79980ba9bcd3937fcda2f621de6d0a0dd8

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/gluon-v14tov15-helper
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=v14tov15-helper
  DEPENDS:=+gluon-core +micrond +wpa-supplicant-mini
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gluon-v14tov15-helper/install
        $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,gluon-v14tov15-helper))

