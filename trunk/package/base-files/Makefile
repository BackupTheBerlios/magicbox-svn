# base-files

PKG_NAME:=		base-files
PKG_VER:=		2006-10-18
PKG_FILE:=		magicbox-$(PKG_NAME)_$(PKG_VER).tgz
PKG_SOURCE:=		ftp://ftp.magicbox.pl/magicbox/source/tarballs/$(PKG_FILE)
PKG_UNPACK:=		tar_gz
PKG_PACK_DIR:=		magicbox-$(PKG_NAME)

define PackageInstall
cd $(PKG_WORKDIR) && cp -a * $(PKG_TMP)
endef

include $(TOPDIR)/include/package.mk
