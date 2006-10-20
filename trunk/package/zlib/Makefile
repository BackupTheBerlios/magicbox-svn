# zlib

PKG_NAME:=		zlib
PKG_VER:=		1.2.3
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://zlib.net/$(PKG_FILE)
#PKG_PACK_DIR:=
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
CC="$(PKG_CC)" CFLAGS="$(PKG_CFLAGS) -fPIC" ./configure --prefix=/ --shared
$(MAKE) -C $(PKG_WORKDIR)
endef

define PackageInstall
$(call InstallFile,$(PKG_WORKDIR)/libz.so.1,lib,libz.so.1,0644)
$(call BinStrip,$(PKG_TMP)/lib/libz.so.1)
endef

include $(TOPDIR)/include/package.mk
