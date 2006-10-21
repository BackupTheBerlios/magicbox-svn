# squashfs

PKG_NAME:=	toolchain_squashfs
PKG_VER:=	3.1-r2
PKG_FILE:=	squashfs$(PKG_VER).tar.gz
PKG_SOURCE:=	http://ovh.dl.sourceforge.net/sourceforge/squashfs/$(PKG_FILE)
PKG_PACK_DIR:=	squashfs$(PKG_VER)
PKG_UNPACK:=	tar_gz
PKG_TOOLCHAIN:=	yes


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR)/squashfs-tools
endef

define PackageInstall
install -d $(TOOLCHAIN_DIR)/bin
install -m755 $(PKG_WORKDIR)/squashfs-tools/mksquashfs $(TOOLCHAIN_DIR)/bin/mksquashfs
install -m755 $(PKG_WORKDIR)/squashfs-tools/unsquashfs $(TOOLCHAIN_DIR)/bin/unsquashfs
endef

include $(TOPDIR)/include/package.mk
