# linux-headers-2.4

PKG_NAME:=		kernel-headers
PKG_VER:=		2.x
PKG_KERNEL_VER:=	2.4.33
PKG_FILE:=		linux-$(PKG_KERNEL_VER).tar.bz2
PKG_SOURCE:=		http://kernel.org/pub/linux/kernel/v2.4/$(PKG_FILE)
PKG_PACK_DIR:=		linux-$(PKG_KERNEL_VER)
PKG_UNPACK:=		tar_bz2
PKG_NO_BINARY:=		yes


define PackagePatch
cp $(PKG_FILES_DIR)/dot.config $(PKG_WORKDIR)/.config
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) $(KERNEL_ENV) oldconfig 
$(MAKE) -C $(PKG_WORKDIR) $(KERNEL_ENV) dep
endef

include $(TOPDIR)/include/package.mk
