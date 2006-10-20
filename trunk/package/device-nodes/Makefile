# device-nodes

PKG_NAME:=		device-nodes
PKG_VER:=		current
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).tgz
PKG_SOURCE:=		ftp://ftp.magicbox.pl/magicbox/source/tarballs/$(PKG_FILE)
PKG_NO_BINARY:=		yes

define PackagePackage
install -m644 $(PKG_FILEPATH) $(PKG_BIN)
endef

include $(TOPDIR)/include/package.mk
