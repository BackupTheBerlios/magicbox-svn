# iptables

PKG_NAME:=		iptables
PKG_VER:=		1.3.6
IPP2P_VER:=		0.8.2
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.bz2 \
			ipp2p-$(IPP2P_VER).tar.gz
PKG_SOURCE:=		ftp://ftp.netfilter.org/pub/iptables/$(word 1,$(PKG_FILE))\
			http://ipp2p.org/downloads/$(word 2,$(PKG_FILE))
PKG_UNPACK:=		tar_bz2


define PackagePatch
cd $(PKG_WORKDIR) && \
  patch -p1 <$(PKG_FILES_DIR)/iptables-layer7-2.6.patch && \
  chmod 755 extensions/.layer7-test
cd $(PKG_WORKDIR) && \
  tar xzvf $(FETCH_DIR)/$(word 2,$(PKG_FILE)) && \
  cp -i ipp2p-$(IPP2P_VER)/*ipp2p.[ch] ./extensions && \
  printf '#!/bin/sh\necho ipp2p\n' > ./extensions/.ipp2p-test && \
  chmod +x ./extensions/.ipp2p-test && \
  rm -rf ipp2p-$(IPP2P_VER)
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
