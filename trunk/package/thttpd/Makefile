# thttpd

PKG_NAME:=		thttpd
PKG_VER:=		2.25b
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://www.acme.com/software/thttpd/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
CFLAGS="$(PKG_CFLAGS)" CC="$(PKG_CC)" ./configure --prefix=/
$(MAKE) -C $(PKG_WORKDIR) CCOPT="$(PKG_CFLAGS)" STATICFLAG=""
endef

define PackageInstall
$(call InstallDir,var/www)
$(call InstallSbin,$(PKG_WORKDIR)/thttpd,thttpd)
$(call InstallSbin,$(PKG_WORKDIR)/extras/htpasswd,htpasswd)
$(call InstallMan,$(PKG_WORKDIR)/thttpd.8,thttpd)
$(call InstallMan,$(PKG_WORKDIR)/extras/htpasswd.1,htpasswd)
endef

include $(TOPDIR)/include/package.mk
