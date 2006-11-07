# magicbox-gpiod

PKG_NAME:=		magicbox-gpiod
PKG_VER:=		2006-11-07
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).tgz
PKG_SOURCE:=		ftp://ftp.magicbox.pl/magicbox/source/tarballs/$(PKG_FILE)
PKG_UNPACK:=		tar_gz
PKG_PACK_DIR:=		$(PKG_NAME)


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) STRIP=$(PKG_STRIP) CFLAGS="$(PKG_CFLAGS)"
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/gpiod,gpiod)
$(call InstallFile,$(PKG_FILES_DIR)/gpiod-button,sbin,gpiod-button,0755)
endef

include $(TOPDIR)/include/package.mk
