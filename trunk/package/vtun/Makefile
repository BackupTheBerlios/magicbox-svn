# vtun

PKG_NAME:=		vtun
PKG_VER:=		2.6
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://surfnet.dl.sourceforge.net/sourceforge/vtun/$(PKG_FILE)
PKG_PACK_DIR:=		vtun
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
CFLAGS="$(PKG_CFLAGS)" CC="$(PKG_CC)" ./configure --prefix=/ --build=$(BUILDARCH) --host=$(HOSTARCH) --disable-ssl --disable-lzo
$(MAKE) -C $(PKG_WORKDIR) CC="$(PKG_CC)"
endef

define PackageInstall
$(call InstallFile,$(PKG_FILES_DIR)/vtund.client.conf,share/etc,vtund.client.conf,0644)
$(call InstallFile,$(PKG_FILES_DIR)/vtund.server.conf,share/etc,vtund.server.conf,0644)
$(call InstallSbin,$(PKG_WORKDIR)/vtund,vtund)
$(call InstallMan,$(PKG_WORKDIR)/vtund.conf.5,vtund.conf)
endef

include $(TOPDIR)/include/package.mk
