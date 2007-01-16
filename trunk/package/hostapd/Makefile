# hostapd

PKG_NAME:=		hostapd
PKG_VER:=		0.4.9
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://hostap.epitest.fi/releases/$(PKG_FILE)
PKG_UNPACK:=		tar_gz

include $(TOPDIR)/Config

ifeq ($(CONFIG_MADWIFI),y)
define PackagePatch
cd $(PKG_WORKDIR) && \
sed -e 's/\(CONFIG_EAP_\)\(TLS\|MSCHAPV2\|TTLS\|PEAP\)/#\1\2/' \
    -e 's/#\(CONFIG_DRIVER_MADWIFI=y\)/\1/' defconfig >.config
cd $(PKG_WORKDIR) && echo "CFLAGS += -I$(BUILD_DIR)/madwifi" >>.config
cd $(PKG_WORKDIR) && \
sed -e "s/CFLAGS = -MMD -O2 -Wall -g/CFLAGS = $(PKG_CFLAGS) -Wall/" Makefile >Makefile.new && \
mv Makefile.new Makefile
endef
else
define PackagePatch
cd $(PKG_WORKDIR) && sed -e 's/\(CONFIG_EAP_\)\(TLS\|MSCHAPV2\|TTLS\PEAP\)/#\1\2/' defconfig >.config
cd $(PKG_WORKDIR) && \
sed -e "s/CFLAGS = -MMD -O2 -Wall -g/CFLAGS = $(PKG_CFLAGS) -Wall/" Makefile >Makefile.new && \
mv Makefile.new Makefile
endef
endif

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC)
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/hostapd,hostapd)
$(call InstallSbin,$(PKG_WORKDIR)/hostapd_cli,hostapd_cli)
$(call InstallFile,$(PKG_WORKDIR)/madwifi.conf,etc,hostapd.conf.example,0644)
$(call InstallFile,$(PKG_WORKDIR)/hostapd.accept,etc,hostapd.accept.example,0644)
$(call InstallFile,$(PKG_WORKDIR)/hostapd.deny,etc,hostapd.deny.example,0644)
$(call InstallFile,$(PKG_WORKDIR)/hostapd.wpa_psk,etc,hostapd.wpa_psk.example,0644)
$(call InstallFile,$(PKG_FILES_DIR)/hostapd,etc/boot.d,hostapd,0755)
$(call InstallMan,$(PKG_WORKDIR)/hostapd.8,hostapd)
$(call InstallMan,$(PKG_WORKDIR)/hostapd_cli.1,hostapd_cli)
endef

include $(TOPDIR)/include/package.mk

