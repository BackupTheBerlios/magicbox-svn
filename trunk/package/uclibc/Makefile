# uclibc

PKG_NAME:=		uclibc
PKG_VER:=		0.9.28
PKG_FILE:=		uClibc-$(PKG_VER).tar.bz2
PKG_SOURCE:=		http://uclibc.org/downloads/$(PKG_FILE)
PKG_PACK_DIR:=		uClibc-$(PKG_VER)
PKG_UNPACK:=		tar_bz2


define PackagePatch
cd $(PKG_WORKDIR) && \
sed -e "s#KERNEL_SOURCE.*#KERNEL_SOURCE=\"$(KERNEL_HEADERS_DIR)\"#" < $(PKG_FILES_DIR)/dot.config >.config
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CROSS=$(PKG_TOOLCHAIN)
$(MAKE) -C $(PKG_WORKDIR) CROSS=$(PKG_TOOLCHAIN) utils
endef

define PackageInstall
$(MAKE) -C $(PKG_WORKDIR) DESTDIR=$(PKG_TMP) install_runtime
$(call InstallSbin,$(PKG_WORKDIR)/utils/ldd,ldd)
$(call InstallSbin,$(PKG_WORKDIR)/utils/ldconfig,ldconfig)
endef

include $(TOPDIR)/include/package.mk
