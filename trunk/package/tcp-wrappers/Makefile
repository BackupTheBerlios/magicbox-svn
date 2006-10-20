# tcp-wrappers

PKG_NAME:=		tcp-wrappers
PKG_VER:=		7.6
PKG_FILE:=		tcp_wrappers_$(PKG_VER).tar.gz
PKG_SOURCE:=		ftp://ftp.porcupine.org/pub/security/$(PKG_FILE)
PKG_PACK_DIR:=		tcp_wrappers_$(PKG_VER)
PKG_UNPACK:=		tar_gz
PKG_NO_BINARY:=		yes


define PackagePatch
cd $(PKG_WORKDIR) && patch -p1 < $(PKG_FILES_DIR)/000-have-strerror.diff
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) EXTRA_CFLAGS="$(PKG_CFLAGS)" \
REAL_DAEMON_DIR=/sbin linux
endef

include $(TOPDIR)/include/package.mk
