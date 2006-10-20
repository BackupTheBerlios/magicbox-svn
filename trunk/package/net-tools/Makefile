# net-tools

PKG_NAME:=		net-tools
PKG_VER:=		1.60
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).orig.tar.gz
PKG_SOURCE:=		http://ftp.debian.org/debian/pool/main/n/net-tools/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR) && \
cp $(PKG_FILES_DIR)/config.h . && \
patch -p1 <$(PKG_FILES_DIR)/000-fix-silly-compiler-error.patch
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) PROGS=arp  CC=$(PKG_CC)
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/arp,arp)
$(call InstallMan,$(PKG_WORKDIR)/man/en_US/arp.8,arp)
endef

include $(TOPDIR)/include/package.mk
