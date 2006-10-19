# dnsmasq

PKG_NAME:=		dnsmasq
PKG_VER:=		2.33
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://www.thekelleys.org.uk/dnsmasq/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) PREFIX=/ CC=$(PKG_CC) CFLAGS="$(PKG_CFLAGS)"
endef

define PackageInstall
$(call InstallDir,share/var/lib/misc)
$(call InstallSbin,$(PKG_WORKDIR)/src/dnsmasq,dnsmasq)
$(call InstallMan,$(PKG_WORKDIR)/man/dnsmasq.8,dnsmasq)
endef

include $(TOPDIR)/include/package.mk
