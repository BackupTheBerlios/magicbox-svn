# ncurses

PKG_NAME:=		ncurses
PKG_VER:=		5.5
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://ftp.gnu.org/pub/gnu/ncurses/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
cd $(PKG_WORKDIR) && \
  ./configure --prefix=$(PKG_PREFIX) --build=$(BUILDARCH) --host=$(HOSTARCH) \
  --without-cxx --without-ada --with-shared --with-normal
$(MAKE) -C $(PKG_WORKDIR) CFLAGS="$(PKG_CFLAGS)"
endef

define PackageInstall
$(call InstallDir,share/terminfo,k)
$(call InstallDir,share/terminfo,l)
$(call InstallDir,share/terminfo,p)
$(call InstallDir,share/terminfo,r)
$(call InstallDir,share/terminfo,v)
$(call InstallDir,share/terminfo,x)
install -d -m755 $(PKG_TMP)/tmp
$(MAKE) -C $(PKG_WORKDIR) DESTDIR=$(PKG_TMP)/tmp install.data
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/l/linux,share/terminfo/l,linux,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/v/vt100,share/terminfo/v,vt100,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/v/vt102,share/terminfo/v,vt102,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/v/vt220,share/terminfo/v,vt220,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/x/xterm,share/terminfo/x,xterm,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/r/rxvt,share/terminfo/r,rxvt,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/k/konsole,share/terminfo/k,konsole,0644)
$(call InstallFile,$(PKG_TMP)/tmp/$(PKG_PREFIX)/share/terminfo/p/putty,share/terminfo/p,putty,0644)
rm -rf $(PKG_TMP)/tmp
cp -Rd $(PKG_WORKDIR)/misc/tabset $(PKG_TMP)/$(PKG_PREFIX)/share
$(call InstallLib,$(PKG_WORKDIR)/lib/libncurses.so.5,libncurses.so.5)
$(call InstallLib,$(PKG_WORKDIR)/lib/libpanel.so.5,libpanel.so.5)
$(call InstallBin,$(PKG_WORKDIR)/progs/tset,tset)
$(call InstallSymlink,bin,tset,reset)
$(call InstallBin,$(PKG_WORKDIR)/progs/tput,tput)
$(call InstallBin,$(PKG_WORKDIR)/progs/clear,clear)
$(call InstallMan,$(PKG_WORKDIR)/man/tset.1,tset)
$(call InstallMan,$(PKG_WORKDIR)/man/tput.1,tput)
$(call InstallMan,$(PKG_WORKDIR)/man/clear.1,clear)
endef

include $(TOPDIR)/include/package.mk
