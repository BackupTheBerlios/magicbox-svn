# u-boot

PKG_NAME:=	u-boot
PKG_VER:=	1.1.4
PKB_FILE:=	$(PKG_NAME)-$(PKG_VER).tar.bz2
PKG_SOURCE:=	ftp://ftp.denx.de/pub/u-boot/$(PKG_FILE)
PKG_UNPACK:=	tar_bz2


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) bubinga_config
$(MAKE) -C $(PKG_WORKDIR) tools HOSTCC=$(HOST_CC) HOSTSTRIP=$(HOST_STRIP) || true
endef

define PackageInstall
install -m755 $(PKG_WORKDIR)/tools/mkimage $(TOOLCHAIN_PREFIX)/bin/mkimage
endef
