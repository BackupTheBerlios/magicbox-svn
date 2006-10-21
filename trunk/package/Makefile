# packages/Makefile

TOPDIR=		$(shell pwd)/../
export TOPDIR

include $(TOPDIR)/Config

obj-y				=

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
	@echo "Asterisk ('*') denotes package name, you can also use word 'all'."
	@echo
	@echo "Total destruction targets:"
	@echo "  all/clean                  - clean package build dirs"
	@echo "  all/pkgclean               - remove all binary packages"
	@echo "  all/distclean              - prune every package"
	@echo "  all/clobber                - same as all/distclean"
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

%/clobber:	%/Makefile
		$(MAKE) -C $* clobber


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
