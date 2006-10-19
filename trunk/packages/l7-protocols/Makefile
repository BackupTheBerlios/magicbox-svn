# iptables

PKG_NAME:=		l7-protocols
PKG_VER:=		2006-09-10
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://belnet.dl.sourceforge.net/sourceforge/l7-filter/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageInstall
$(call InstallDir,share/l7-protocols)
$(call InstallDir,share/etc)
$(call InstallSymlink,share/etc,/share/l7-protocols,l7-protocols)
cp -Rd $(PKG_WORKDIR)/protocols $(PKG_TMP)/share/l7-protocols
cp -Rd $(PKG_WORKDIR)/file_types $(PKG_TMP)/share/l7-protocols
cp -Rd $(PKG_WORKDIR)/malware $(PKG_TMP)/share/l7-protocols
cp -Rd $(PKG_WORKDIR)/extra $(PKG_TMP)/share/l7-protocols
find $(PKG_TMP) -type d -print0 | xargs -0 chmod 755
find $(PKG_TMP) -type f -print0 | xargs -0 chmod 644
endef

include $(TOPDIR)/include/package.mk
