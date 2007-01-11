# arptables

PKG_NAME:=		arptables
PKG_VER:=		0.0.3
PKG_FILE:=		$(PKG_NAME)-v$(PKG_VER)-2.tar.gz
PKG_SOURCE:=		http://surfnet.dl.sourceforge.net/sourceforge/ebtables/$(PKG_FILE)
PKG_UNPACK:=		tar_gz
PKG_PACK_DIR:=		$(PKG_NAME)-v$(PKG_VER)-2


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) COPT_FLAGS=$(PKG_CFLAGS) PREFIX=$(PKG_PREFIX)
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/arptables,arptables)
$(call InstallMan,$(PKG_WORKDIR)/arptables.8,arptables)
endef

include $(TOPDIR)/include/package.mk
