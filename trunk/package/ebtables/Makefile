# ebtables

PKG_NAME:=		ebtables
PKG_VER:=		2.0.6
PKG_FILE:=		$(PKG_NAME)-v$(PKG_VER).tar.gz
PKG_SOURCE:=		http://surfnet.dl.sourceforge.net/sourceforge/ebtables/$(PKG_FILE)
PKG_PACK_DIR:=		$(PKG_NAME)-v$(PKG_VER)
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR) && \
patch -p1 < $(PKG_FILES_DIR)/000-fix-nonsense-compiler-error.diff
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) CFLAGS="$(PKG_CFLAGS) -Wall -Wunused"
endef

define PackageInstall
$(call InstallFile,$(PKG_WORKDIR)/ethertypes,share/etc,ethertypes,0644)
$(call InstallSbin,$(PKG_WORKDIR)/ebtables,ebtables)
$(call InstallMan,$(PKG_WORKDIR)/ebtables.8,ebtables)
endef

include $(TOPDIR)/include/package.mk
