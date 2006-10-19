# squashfs

PKG_NAME:=	squashfs
PKG_VER:=	3.1-r2
PKB_FILE:=
PKG_SOURCE:=
PKG_UNPACK:=	tar_gz


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR)/squashfs-tools CC=$(HOST_CC) \
  CFLAGS="-I. -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
endef

define PackageInstall
install -m755 $(PKG_WORKDIR)/squashfs-tools/mksquashfs $(TOOLCHAIN_PREFIX)/bin/mksquashfs
endef
