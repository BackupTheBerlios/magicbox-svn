# portmap

PKG_NAME:=		portmap
PKG_VER:=		5beta
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).tar.gz
PKG_SOURCE:=		ftp://ftp.porcupine.org/pub/security/$(PKG_FILE)
PKG_PACK_DIR:=		$(PKG_NAME)_$(PKG_VER)
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR) && zcat $(PKG_FILES_DIR)/portmap_5-17.diff.gz | patch -p1
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC)
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/portmap,portmap)
$(call InstallMan,$(PKG_WORKDIR)/portmap.8,portmap)
endef

include $(TOPDIR)/include/package.mk
