PKG_NAME:=		bridge-utils
PKG_VER:=		1.1
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://kent.dl.sf.net/sourceforge/bridge/$(PKG_FILE)
PKG_UNPACK:=		tar_gz

define PackageBuild
cd $(PKG_WORKDIR) && \
CFLAGS="$(PKG_CFLAGS)" ./configure --build=$(BUILDARCH) --host=$(HOSTARCH)  --prefix=/
$(MAKE) -C $(PKG_WORKDIR)
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/brctl/brctl,brctl)
$(call InstallMan,$(PKG_WORKDIR)/doc/brctl.8,brctl)
endef

include $(TOPDIR)/include/package.mk
