# iptraf

PKG_NAME:=		iptraf
PKG_VER:=		3.0.0
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		ftp://iptraf.seul.org/pub/iptraf/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackagePatch
cp $(PKG_FILES_DIR)/Makefile.support $(PKG_WORKDIR)/support/Makefile
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR)/src WORKDIR=/var/lib/iptraf TARGET=/bin \
  CFLAGS="$(PKG_CFLAGS)" CC=$(PKG_CC)
endef

define PackageInstall
$(call InstallDir,var/lib/iptraf)
$(call InstallDir,var/log/iptraf)
$(call InstallSbin,$(PKG_WORKDIR)/src/iptraf,iptraf)
$(call InstallMan,$(PKG_WORKDIR)/Documentation/iptraf.8,iptraf)
endef

include $(TOPDIR)/include/package.mk
