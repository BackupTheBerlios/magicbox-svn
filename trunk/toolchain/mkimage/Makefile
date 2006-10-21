# mkimage (from u-boot)

PKG_NAME:=	toolchain_mkimage
PKG_VER:=	1.1.4
PKG_FILE:=	u-boot-$(PKG_VER).tar.bz2
PKG_SOURCE:=	ftp://ftp.denx.de/pub/u-boot/$(PKG_FILE)
PKG_UNPACK:=	tar_bz2
PKG_PACK_DIR:=	u-boot-$(PKG_VER)
PKG_TOOLCHAIN:=	yes


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) bubinga_config
$(MAKE) -C $(PKG_WORKDIR) tools
endef

define PackageInstall
install -d $(TOOLCHAIN_DIR)/bin
install -m755 $(PKG_WORKDIR)/tools/mkimage $(TOOLCHAIN_DIR)/bin/mkimage
endef

include $(TOPDIR)/include/package.mk
