# openntpd

PKG_NAME:=		openntpd
PKG_VER:=		3.9p1
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
CFLAGS="$(PKG_CFLAGS)" ./configure --prefix=/ --build=$(BUILDARCH) --host=$(HOSTARCH) --with-builtin-arc4random --with-privsep-user=openntpd
$(MAKE) -C $(PKG_WORKDIR)
endef

define PackageInstall
$(call InstallDir,share/var/lib/openntpd)
$(call InstallFile,$(PKG_FILES_DIR)/ntpd.conf,share/etc,ntpd.conf,0644)
$(call InstallSbin,$(PKG_WORKDIR)/ntpd,ntpd)
$(call InstallMan,$(PKG_WORKDIR)/ntpd.8,ntpd)
endef

include $(TOPDIR)/include/package.mk
