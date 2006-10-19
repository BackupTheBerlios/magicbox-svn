# iptables

PKG_NAME:=		iptables
PKG_VER:=		1.3.6
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.bz2
PKG_SOURCE:=		ftp://ftp.netfilter.org/pub/iptables/$(PKG_FILE)
PKG_UNPACK:=		tar_bz2


define PackagePatch
cd $(PKG_WORKDIR) && \
patch -p1 <$(PKG_FILES_DIR)/iptables-layer7-2.6.patch && \
chmod 755 extensions/.layer7-test
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) KERNEL_DIR=$(KERNEL_BUILD_DIR) DO_IPV6=1 NO_SHARED_LIBS=1 COPT_FLAGS="$(PKG_CFLAGS)" LDFLAGS=''
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/iptables,iptables)
$(call InstallMan,$(PKG_WORKDIR)/iptables.8,iptables)
$(call InstallSymlink,sbin,iptables,iptables-save)
$(call InstallSymlink,sbin,iptables,iptables-restore)
$(call InstallMan,$(PKG_WORKDIR)/iptables-save.8,iptables-save)
$(call InstallMan,$(PKG_WORKDIR)/iptables-restore.8,iptables-restore)
endef

include $(TOPDIR)/include/package.mk
