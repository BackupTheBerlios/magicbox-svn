# strace

PKG_NAME:=		strace
PKG_VER:=		4.5.14
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.bz2
PKG_SOURCE:=		http://surfnet.dl.sourceforge.net/sourceforge/strace/$(PKG_FILE)
PKG_UNPACK:=		tar_bz2


define PackageBuild
cd $(PKG_WORKDIR) && \
CFLAGS="$(PKG_CFLAGS)" ./configure --build=$(BUILDARCH) --host=$(HOSTARCH)
$(MAKE) -C $(PKG_WORKDIR)
endef

define PackageInstall
$(call InstallBin,$(PKG_WORKDIR)/strace,strace)
$(call InstallMan,$(PKG_WORKDIR)/strace.1,strace)
endef

include $(TOPDIR)/include/package.mk
