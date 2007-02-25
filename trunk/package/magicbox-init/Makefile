# magicbox-init

PKG_NAME:=		magicbox-init
PKG_VER:=		2007-02-25
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).tgz
PKG_SOURCE:=		ftp://ftp.magicbox.pl/magicbox/source/tarballs/$(PKG_FILE)
PKG_UNPACK:=		tar_gz
PKG_PACK_DIR:=		$(PKG_NAME)


define PackageInstall
cd $(PKG_WORKDIR) && cp -a * $(PKG_TMP)
endef

include $(TOPDIR)/include/package.mk
