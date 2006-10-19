# libpcap

PKG_NAME:=		libpcap
PKG_VER:=		0.9.5
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://www.tcpdump.org/release/$(PKG_FILE)
#PKG_PACK_DIR:=
PKG_UNPACK:=		tar_gz
PKG_NO_BINARY:=		yes


define PackageBuild
cd $(PKG_WORKDIR) && \
ac_cv_linux_vers=2 CC=$(PKG_CC) CFLAGS="$(PKG_CFLAGS)" ./configure \
--enable-ipv6 --with-pcap=linux --build=$(BUILDARCH) --host=$(HOSTARCH)
$(MAKE) -C $(PKG_WORKDIR)
endef

include $(TOPDIR)/include/package.mk
