# fakeroot

PKG_NAME:=	toolchain_fakeroot
PKG_VER:=	1.2.10
PKG_FILE:=	fakeroot_$(PKG_VER).tar.gz
PKG_SOURCE:=	http://ftp.debian.org/debian/pool/main/f/fakeroot/$(PKG_FILE)
PKG_UNPACK:=	tar_gz
PKG_PACK_DIR:=	fakeroot-$(PKG_VER)
PKG_TOOLCHAIN:=	yes


define PackageBuild
cd $(PKG_WORKDIR) && ./configure --prefix=$(TOOLCHAIN_DIR)
$(MAKE) -C $(PKG_WORKDIR)
endef

define PackageInstall
$(MAKE) -C $(PKG_WORKDIR) install
endef

include $(TOPDIR)/include/package.mk
