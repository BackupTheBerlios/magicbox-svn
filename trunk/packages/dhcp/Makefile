# dhcpd

PKG_NAME:=		dhcp
PKG_VER:=		2.0pl5
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).orig.tar.gz
PKG_SOURCE:=		http://ftp.debian.org/debian/pool/main/d/dhcp/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR) && patch -p1 < $(PKG_FILES_DIR)/format-string.patch
endef

define PackageBuild
cd $(PKG_WORKDIR) && ./configure linux-2.2
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) COPTS="$(PKG_CFLAGS)"
endef

define PackageInstall
$(call InstallDir,share/var/state/dhcp)
touch $(PKG_TMP)/share/var/state/dhcp/dhcpd.leases
$(call InstallSbin,$(PKG_WORKDIR)/server/dhcpd,dhcpd)
$(call InstallMan,$(PKG_WORKDIR)/server/dhcpd.8,dhcpd)
$(call InstallMan,$(PKG_WORKDIR)/server/dhcpd.conf.5,dhcpd.conf)
$(call InstallMan,$(PKG_WORKDIR)/server/dhcpd.leases.5,dhcpd.leases)
$(call InstallSbin,$(PKG_WORKDIR)/relay/dhcrelay,dhcrelay)
$(call InstallMan,$(PKG_WORKDIR)/relay/dhcrelay.8,dhcrelay)
endef

include $(TOPDIR)/include/package.mk
