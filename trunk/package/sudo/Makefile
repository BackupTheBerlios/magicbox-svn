# sudo

# How to cross-compile this damn thing:
#  run ./configure on build system targetting _build_ system
#  fix config.h to have values appropriate to host system
#  run make
#
# UGLIEST.  THING.  EVER.

PKG_NAME:=		sudo
PKG_VER:=		1.6.8p12
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://ftp.tpnet.pl/vol/d6/ftp.sudo.ws/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
./configure --without-insults --with-editor=/bin/vi --without-sendmail --without-lecture --disable-shared
cp $(PKG_FILES_DIR)/config.h $(PKG_WORKDIR)
cp $(PKG_FILES_DIR)/pathnames.h $(PKG_WORKDIR)
make -C $(PKG_WORKDIR) CC=$(PKG_CC) CFLAGS="$(PKG_CFLAGS)"
endef

define PackageInstall
$(call InstallBin,$(PKG_WORKDIR)/sudo,sudo)
$(call InstallMan,$(PKG_WORKDIR)/sudoers.man,sudoers)
endef

include $(TOPDIR)/include/package.mk
