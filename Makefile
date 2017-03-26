
include $(TOPDIR)/rules.mk
PKG_NAME:=amt
PKG_VERSION:=openwrt
PKG_RELEASE:=95d84d8650f44dca62457bebab387c8d401fcede

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/GrumpyOldTroll/amt/archive/$(PKG_VERSION)/$(PKG_RELEASE).tar.gz
PKG_MD5SUM:=8cfaa6a2e2e2bdd49d9d27cc6654ff53
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

