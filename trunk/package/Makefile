# packages/Makefile

TOPDIR=		$(shell pwd)/../
export TOPDIR

include $(TOPDIR)/Config

obj-y				=
obj-m				=

# Kernel related
obj-$(CONFIG_KERNEL)		+= kernel
obj-$(CONFIG_MADWIFI)		+= madwifi
obj-$(CONFIG_RT2X00)		+= rt2x00

# Base system
obj-$(CONFIG_KERNEL_HEADERS)	+= kernel-headers
obj-$(CONFIG_UCLIBC)		+= uclibc
obj-$(CONFIG_BUSYBOX)		+= busybox
obj-$(CONFIG_BASE_FILES)	+= base-files
obj-$(CONFIG_DEVICE_NODES)	+= device-nodes
obj-$(CONFIG_MAGICBOX_INIT)	+= magicbox-init
obj-$(CONFIG_HOTPLUG)		+= hotplug
obj-$(CONFIG_MTD_UTILS)		+= mtd-utils

# Libs
obj-$(CONFIG_ZLIB)		+= zlib
obj-$(CONFIG_LIBPCAP)		+= libpcap
obj-$(CONFIG_NCURSES)		+= ncurses
obj-$(CONFIG_TCP_WRAPPERS)	+= tcp-wrappers

# User interface
obj-$(CONFIG_MAGICBOX_UI)	+= magicbox-ui
obj-$(CONFIG_PERL)		+= perl
obj-$(CONFIG_SUDO)		+= sudo

# Daemons
obj-$(CONFIG_CRON)		+= cron
obj-$(CONFIG_DHCP)		+= dhcp
obj-$(CONFIG_DNSMASQ)		+= dnsmasq
obj-$(CONFIG_DROPBEAR)		+= dropbear
obj-$(CONFIG_MAGICBOX_GPIOD)	+= magicbox-gpiod
obj-$(CONFIG_OPENNTPD)		+= openntpd
obj-$(CONFIG_PORTMAP)		+= portmap
obj-$(CONFIG_THTTPD)		+= thttpd
obj-$(CONFIG_VTUN)		+= vtun

# Networking
obj-$(CONFIG_ARPTABLES)		+= arptables
obj-$(CONFIG_BRIDGE_UTILS)	+= bridge-utils
obj-$(CONFIG_EBTABLES)		+= ebtables
obj-$(CONFIG_IPROUTE)		+= iproute
obj-$(CONFIG_IPTABLES)		+= iptables
obj-$(CONFIG_NET_TOOLS)		+= net-tools
obj-$(CONFIG_WIRELESS_TOOLS)	+= wireless-tools

# Utilities
obj-$(CONFIG_HOSTAP_UTILS)	+= hostap-utils
obj-$(CONFIG_HOSTAPD)		+= hostapd
obj-$(CONFIG_IPTRAF)		+= iptraf
obj-$(CONFIG_PCIUTILS)		+= pciutils
obj-$(CONFIG_L7_PROTOCOLS)	+= l7-protocols
obj-$(CONFIG_STRACE)		+= strace
obj-$(CONFIG_TCPDUMP)		+= tcpdump
obj-$(CONFIG_NFS_UTILS)		+= nfs-utils


all:
	@echo "Package targets:"
	@echo "  */fetch                    - fetch sources"
	@echo "  */unpack                   - unpack sources"
	@echo "  */patch                    - patch sources"
	@echo "  */build                    - compile package"
	@echo "  */install                  - install package to tmp directory"
	@echo "  */package                  - create .tgz package"
	@echo "  */clean                    - remove package build directory"
	@echo "  */pkgclean                 - remove binary package"
	@echo "  */distclean                - prune package"
	@echo "  */clobber                  - same as distclean"
	@echo
	@echo "Asterisk ('*') denotes package name.  You can also use:"
	@echo "  all                        - for builtin (=y) packages"
	@echo "  mod                        - for external (=m) packages."
	@echo
	@echo "Note that all/distclean works as advertised."
	@echo "(all/distclean can also be called Total Destruction Target.)"
	@echo

help:	all

%/fetch:	%/Makefile
		$(MAKE) -C $* fetch

%/unpack:	%/Makefile
		$(MAKE) -C $* unpack

%/patch:	%/Makefile
		$(MAKE) -C $* patch

%/build:	%/Makefile %/depend
		$(MAKE) -C $* build

%/install:	%/Makefile %/depend
		$(MAKE) -C $* install

%/package:	%/Makefile %/depend
		$(MAKE) -C $* package

%/clean:	%/Makefile
		$(MAKE) -C $* clean

%/pkgclean:	%/Makefile
		$(MAKE) -C $* pkgclean

%/distclean:	%/Makefile
		$(MAKE) -C $* distclean

%/clobber:	%/distclean


all/fetch:		$(patsubst %,%/fetch,$(obj-y))
all/unpack:		$(patsubst %,%/unpack,$(obj-y))
all/patch:		$(patsubst %,%/patch,$(obj-y))
all/build:		$(patsubst %,%/build,$(obj-y))
all/package:		$(patsubst %,%/package,$(obj-y))
all/install:		$(patsubst %,%/install,$(obj-y))
all/clean:		$(patsubst %,%/clean,$(obj-y))
all/pkgclean:		$(patsubst %,%/pkgclean,$(obj-y))
all/distclean:		$(patsubst %,%/distclean,$(obj-y))
all/clobber:		all/distclean

%/depend:	;
iptables/depend madwifi/depend rt2x00/depend: 	kernel/install
uclibc/depend kernel/depend:		 	kernel-headers/install
#dropbear/depend:				zlib/install


%/patch-mod:	%/Makefile
		$(MAKE) -C $* patch PKG_MODULE=y

%/build-mod:	%/Makefile %/depend
		$(MAKE) -C $* build PKG_MODULE=y

%/install-mod:	%/Makefile %/depend
		$(MAKE) -C $* install PKG_MODULE=y

%/package-mod:	%/Makefile %/depend
		$(MAKE) -C $* package PKG_MODULE=y

%/clean-mod:	%/Makefile
		$(MAKE) -C $* clean PKG_MODULE=y

%/pkgclean-mod:	%/Makefile
		$(MAKE) -C $* pkgclean PKG_MODULE=y

%/distclean-mod:	%/Makefile
		$(MAKE) -C $* distclean PKG_MODULE=y

%/clobber-mod:	%/distclean-mod

mod/fetch:		$(patsubst %,%/fetch,$(obj-m))
mod/unpack:		$(patsubst %,%/unpack,$(obj-m))
mod/patch:		$(patsubst %,%/patch-mod,$(obj-m))
mod/build:		$(patsubst %,%/build-mod,$(obj-m))
mod/package:		$(patsubst %,%/package-mod,$(obj-m))
mod/install:		$(patsubst %,%/install-mod,$(obj-m))
mod/clean:		$(patsubst %,%/clean-mod,$(obj-m))
mod/pkgclean:		$(patsubst %,%/pkgclean-mod,$(obj-m))
mod/distclean:		$(patsubst %,%/distclean-mod,$(obj-m))
mod/clobber:		mod/distclean
