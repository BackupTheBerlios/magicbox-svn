# dropbear

PKG_NAME:=		dropbear
PKG_VER:=		0.48.1
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://matt.ucc.asn.au/dropbear/releases/$(PKG_FILE)
PKG_UNPACK:=		tar_gz

define PackageBuild
cd $(PKG_WORKDIR) && \
CFLAGS="$(PKG_CFLAGS)" ./configure --build=$(BUILDARCH) --host=$(HOSTARCH) \
	--prefix=/
make -C $(PKG_WORKDIR) MULTI=1
endef

define PackageInstall
$(call InstallDir,etc/dropbear)
$(call InstallSbin,$(PKG_WORKDIR)/dropbearmulti,dropbear)
$(call InstallSymlink,sbin,dropbear,dropbearkey)
$(call InstallDir,bin)
$(call InstallSymlink,bin,../sbin/dropbear,ssh)
$(call InstallMan,$(PKG_WORKDIR)/dropbear.8,dropbear)
$(call InstallMan,$(PKG_WORKDIR)/dropbearkey.8,dropbearkey)
$(call InstallMan,$(PKG_WORKDIR)/dbclient.1,ssh)
endef

include $(TOPDIR)/include/package.mk
