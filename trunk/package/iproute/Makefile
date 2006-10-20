# iproute

PKG_NAME:=		iproute
PKG_VER:=		2.6.18-061002
PKG_FILE:=		$(PKG_NAME)2-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://developer.osdl.org/dev/iproute2/download/$(PKG_FILE)
PKG_PACK_DIR:=		iproute2-$(PKG_VER)
PKG_UNPACK:=		tar_gz


# For iproute-20041019
#define PackagePatch
#cd $(PKG_WORKDIR) && \
#patch -p1 <$(PKG_FILES_DIR)/000-iproute-cross-and-misc-fixes.diff
#endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) CCOPTS="$(PKG_CFLAGS) -D_GNU_SOURCE -Wstrict-prototypes -Wall"
endef

define PackageInstall
$(call InstallFile,$(PKG_WORKDIR)/etc/iproute2/rt_dsfield,share/etc/iproute2,rt_dsfield,0644)
$(call InstallFile,$(PKG_WORKDIR)/etc/iproute2/rt_protos,share/etc/iproute2,rt_protos,0644)
$(call InstallFile,$(PKG_WORKDIR)/etc/iproute2/rt_realms,share/etc/iproute2,rt_realms,0644)
$(call InstallFile,$(PKG_WORKDIR)/etc/iproute2/rt_scopes,share/etc/iproute2,rt_scopes,0644)
$(call InstallFile,$(PKG_WORKDIR)/etc/iproute2/rt_tables,share/etc/iproute2,rt_tables,0644)
$(call InstallBin,$(PKG_WORKDIR)/ip/ip,ip)
$(call InstallFile,$(PKG_WORKDIR)/ip/routel,bin,routel,0755)
$(call InstallFile,$(PKG_WORKDIR)/ip/routef,sbin,routef,0755)
$(call InstallFile,$(PKG_WORKDIR)/ip/routef,sbin,routef,0755)
$(call InstallSbin,$(PKG_WORKDIR)/tc/tc,tc)
$(call InstallFile,$(PKG_WORKDIR)/tc/q_netem.so,lib/tc,q_netem.so,0644)
$(call BinStrip,$(PKG_TMP)/lib/tc/q_netem.so)
$(call InstallSbin,$(PKG_WORKDIR)/misc/ifstat,ifstat)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/ip.8,ip)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc.8,tc)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-pbfifo.8,tc-pbfifo)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-pfifo_fast.8,tc-pfifo_fast)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-prio.8,tc-prio)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-sfq.8,tc-sfq)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-red.8,tc-red)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-tbf.8,tc-tbf)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-cbq.8,tc-cbq)
$(call InstallMan,$(PKG_WORKDIR)/man/man8/tc-cbq-details.8,tc-cbq-details)
endef

include $(TOPDIR)/include/package.mk
