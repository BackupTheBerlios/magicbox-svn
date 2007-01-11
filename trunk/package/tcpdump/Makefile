# tcpdump

PKG_NAME:=		tcpdump
PKG_VER:=		3.9.5
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://www.tcpdump.org/release/$(PKG_FILE)
#PKG_PACK_DIR:=
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no CC=$(PKG_CC) \
CFLAGS="$(PKG_CFLAGS)" ./configure --prefix=$(PKG_PREFIX) --host=$(HOSTARCH) \
--build=$(BUILDARCH) --enable-ipv6 --disable-smb --with-user=tcpdump \
--with-chroot=/var/lib/tcpdump && \
mv Makefile Makefile.orig && sed -e 's#-I/usr/include##g' <Makefile.orig >Makefile
$(MAKE) -C $(PKG_WORKDIR)
endef

define PackageInstall
$(call InstallSbin,$(PKG_WORKDIR)/tcpdump,tcpdump)
$(call InstallMan,$(PKG_WORKDIR)/tcpdump.1,tcpdump)
$(call InstallFile,$(PKG_FILES_DIR)/tcpdump,etc/boot.d,tcpdump,0755)
endef

include $(TOPDIR)/include/package.mk
