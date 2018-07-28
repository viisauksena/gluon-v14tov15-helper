include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-v14tov15-helper
PKG_SOURCE_PROTO:=git
PKG_VERSION:=3
PKG_SOURCE_URL:=https://github.com/viisauksena/gluon-v14tov15-helper.git

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

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

