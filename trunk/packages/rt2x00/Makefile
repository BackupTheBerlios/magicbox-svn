# rt2x00

PKG_NAME:=		rt2x00
PKG_VER:=		cvs-daily
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://rt2x00.serialmonkey.com/$(PKG_FILE)
PKG_PACK_DIR:=		rt2x00-cvs-??????????
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR) && \
sed -e 's/USB=y/USB=n/' <config >config.new && \
sed -e 's@/sbin/depmod -a@@' <Makefile >Makefile.new && \
mv config.new config && \
mv Makefile.new Makefile
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) $(KERNEL_ENV) KERNDIR=$(KERNEL_BUILD_DIR)
endef

define PackageInstall
$(MAKE) -C $(PKG_WORKDIR) $(KERNEL_ENV) KERNDIR=$(KERNEL_BUILD_DIR) \
INSTALL_MOD_PATH=$(PKG_TMP) install
rm -f $(PKG_TMP)/lib/modules/$(KERNEL_VER)/modules.*
endef

include $(TOPDIR)/include/package.mk
-include $(KERNEL_VER_FILE)
