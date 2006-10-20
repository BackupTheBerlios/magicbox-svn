# hostap-utils

PKG_NAME:=		hostap-utils
PKG_VER:=		0.4.7
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://hostap.epitest.fi/releases/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) CFLAGS="$(PKG_CFLAGS)"
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/hostap_crypt_conf,hostap_crypt_conf)
$(call InstallSbin,$(PKG_WORKDIR)/hostap_diag,hostap_diag)
$(call InstallFile,$(PKG_WORKDIR)/prism2_param,sbin,prism2_param,0755)
$(call InstallSbin,$(PKG_WORKDIR)/prism2_srec,prism2_srec)
endef

include $(TOPDIR)/include/package.mk
