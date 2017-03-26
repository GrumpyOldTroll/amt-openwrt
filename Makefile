
include $(TOPDIR)/rules.mk
PKG_NAME:=amt
PKG_VERSION:=openwrt
PKG_RELEASE:=a552359e07d2866585c94266066b7453a7cefcbd

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/GrumpyOldTroll/amt/archive/$(PKG_VERSION)/$(PKG_RELEASE).tar.gz
PKG_MD5SUM:=b60d7bf00f2a13bb6a5093776f097250
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/amt
  TITLE:=Automatic Multicast without Explicit Tunnels (AMT)
  CATEGORY:=Network
  DEPENDS:=+libevent2
endef

define Package/amt/description
  AMT provides a way for a host, proxy, or router on a non-multicast
  capable network to join multicast groups on a remote multicast
  capable network through a relay on that network.
endef

define Package/amt/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/relay/amtrelayd $(1)/sbin/
endef

$(eval $(call BuildPackage,amt))

