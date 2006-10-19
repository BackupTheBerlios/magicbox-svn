# mtd-utils

PKG_NAME:=		mtd-utils
PKG_VER:=		1.0.1
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		ftp://linux-mtd.infradead.org/pub/mtd-utils/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CROSS=$(PKG_TOOLCHAIN) CFLAGS="$(PKG_CFLAGS) -Wall -I./include" RAWTARGETS="flashcp flash_erase flash_eraseall" BUILDDIR=.
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/flashcp,flashcp)
$(call InstallSbin,$(PKG_WORKDIR)/flash_erase,flash_erase)
$(call InstallSbin,$(PKG_WORKDIR)/flash_eraseall,flash_eraseall)
endef

include $(TOPDIR)/include/package.mk
