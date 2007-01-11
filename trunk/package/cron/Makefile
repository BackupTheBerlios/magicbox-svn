# debian's vixie-cron

PKG_NAME:=		cron
PKG_VER:=		3.0pl1
PKG_FILE:=		$(PKG_NAME)_$(PKG_VER).orig.tar.gz
PKG_SOURCE:=		http://ftp.debian.org/debian/pool/main/c/cron/$(PKG_FILE)
PKG_UNPACK:=		tar_gz
PKG_PACK_DIR:=		$(PKG_NAME)-$(PKG_VER).orig

define PackagePatch
cd $(PKG_WORKDIR) && zcat $(PKG_FILES_DIR)/cron_3.0pl1-95-debian.diff.gz | patch -p1
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) LIBS='' OPTIM=$(PKG_CFLAGS)
endef

define PackageInstall
$(call InstallDir,etc/cron.d)
rm -f $(PKG_TMP)/etc/crontab
echo '# See crontab.conf(5)' >> $(PKG_TMP)/etc/crontab
echo '# min hour day month day-of-week user command' >> $(PKG_TMP)/etc/crontab
$(call InstallDir,var/spool/cron/crontabs)
$(call InstallSbin,$(PKG_WORKDIR)/cron,cron)
$(call InstallMan,$(PKG_WORKDIR)/crontab.5,crontab)
$(call InstallMan,$(PKG_WORKDIR)/cron.8,cron)
endef

include $(TOPDIR)/include/package.mk
