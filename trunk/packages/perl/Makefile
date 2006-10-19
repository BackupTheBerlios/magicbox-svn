# perl

PKG_NAME:=		perl
PKG_VER:=		5.8.7
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.bz2
PKG_SOURCE:=		http://ftp.funet.fi/pub/CPAN/src/$(PKG_FILE)
PKG_UNPACK:=		tar_bz2


define PackagePatch
cd $(PKG_WORKDIR) && \
cp $(PKG_FILES_DIR)/config.sh . && \
patch -p1 <$(PKG_FILES_DIR)/000-perl-unmicrofify-build.diff
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) -f Makefile.micro regen_uconfig
$(MAKE) -C $(PKG_WORKDIR) -f Makefile.micro
endef

define PackageInstall
$(call InstallBin,$(PKG_WORKDIR)/microperl,perl)
$(call InstallFile,$(PKG_WORKDIR)/lib/strict.pm,lib/perl5/$(PKG_VER),strict.pm,0644)
$(call InstallFile,$(PKG_WORKDIR)/lib/warnings.pm,lib/perl5/$(PKG_VER),warnings.pm,0644)
$(call InstallFile,$(PKG_WORKDIR)/lib/warnings/register.pm,lib/perl5/$(PKG_VER)/warnings,register.pm,0644)
$(call InstallFile,$(PKG_WORKDIR)/lib/Carp.pm,lib/perl5/$(PKG_VER),Carp.pm,0644)
$(call InstallFile,$(PKG_WORKDIR)/lib/Exporter.pm,lib/perl5/$(PKG_VER),Exporter.pm,0644)
$(call InstallFile,$(PKG_WORKDIR)/lib/UNIVERSAL.pm,lib/perl5/$(PKG_VER),UNIVERSAL.pm,0644)
endef

include $(TOPDIR)/include/package.mk
