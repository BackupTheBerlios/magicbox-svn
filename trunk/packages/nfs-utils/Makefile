# nfs-utils

PKG_NAME:=		nfs-utils
PKG_VER:=		1.0.7
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://surfnet.dl.sourceforge.net/sourceforge/nfs/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR) && zcat $(PKG_FILES_DIR)/nfs-utils_1.0.7-10.diff.gz | patch -p1
cd $(PKG_WORKDIR) && patch -p1 < $(PKG_FILES_DIR)/000-fix-configmk.diff
cd $(PKG_WORKDIR) && patch -p1 < $(PKG_FILES_DIR)/001-remove-getrpcnumberr.diff
endef

define PackageBuild
cd $(PKG_WORKDIR) && \
CC=$(PKG_CC) CFLAGS="$(PKG_CFLAGS)" ./configure --enable-nfsv3 --with-prefix=/\
  --build=i386-linux --host=powerpc-linux --disable-nfsv4 --disable-gss
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC)
endef

define PackageInstall
$(call InstallDir,var/lib/nfs)
$(call InstallDir,var/lib/nfs/sm)
$(call InstallDir,var/lib/nfs/sm.bak)
touch $(PKG_TMP)/var/lib/nfs/etab
touch $(PKG_TMP)/var/lib/nfs/rmtab
touch $(PKG_TMP)/var/lib/nfs/state
chmod 600 $(PKG_TMP)/var/lib/nfs/state
touch $(PKG_TMP)/var/lib/nfs/xtab
$(call InstallSbin,$(PKG_WORKDIR)/utils/exportfs/exportfs,exportfs)
$(call InstallSbin,$(PKG_WORKDIR)/utils/statd/statd,rpc.statd)
$(call InstallSbin,$(PKG_WORKDIR)/utils/lockd/lockd,rpc.lockd)
$(call InstallSbin,$(PKG_WORKDIR)/utils/mountd/mountd,rpc.mountd)
$(call InstallSbin,$(PKG_WORKDIR)/utils/nfsd/nfsd,rpc.nfsd)
$(call InstallSbin,$(PKG_WORKDIR)/utils/showmount/showmount,showmount)
$(call InstallMan,$(PKG_WORKDIR)/utils/exportfs/exportfs.man,exportfs)
$(call InstallMan,$(PKG_WORKDIR)/utils/exportfs/exports.man,exports)
$(call InstallMan,$(PKG_WORKDIR)/utils/statd/statd.man,rpc.statd)
$(call InstallMan,$(PKG_WORKDIR)/utils/lockd/lockd.man,rpc.lockd)
$(call InstallMan,$(PKG_WORKDIR)/utils/mountd/mountd.man,rpc.mountd)
$(call InstallMan,$(PKG_WORKDIR)/utils/nfsd/nfsd.man,rpc.nfsd)
$(call InstallMan,$(PKG_WORKDIR)/utils/showmount/showmount.man,showmount)
endef

include $(TOPDIR)/include/package.mk
