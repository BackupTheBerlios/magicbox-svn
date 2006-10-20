# busybox

PKG_NAME:=		busybox
PKG_VER:=		1.1.3
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.bz2
PKG_SOURCE:=		http://busybox.net/downloads/$(PKG_FILE)
PKG_UNPACK:=		tar_bz2

define PackagePatch
cp $(PKG_FILES_DIR)/dot.config-$(PKG_VER) $(PKG_WORKDIR)/.config
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CROSS=$(PKG_TOOLCHAIN)
endef

define PackageInstall
$(call InstallMan,$(PKG_WORKDIR)/docs/BusyBox.1,busybox)
$(MAKE) -C $(PKG_WORKDIR) PREFIX=$(PKG_TMP) install
endef

include $(TOPDIR)/include/package.mk
