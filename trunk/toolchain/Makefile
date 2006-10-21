# toolchain/Makefile

TOPDIR=		$(shell pwd)/../
export TOPDIR

include $(TOPDIR)/Config
include $(TOPDIR)/include/variables.mk

obj-y					=
obj-$(CONFIG_TOOLCHAIN_MKIMAGE)		+= mkimage
obj-$(CONFIG_TOOLCHAIN_SQUASHFS)	+= squashfs

all:
	@echo "Toolchain targets:"
	@echo "  */fetch                    - fetch sources"
	@echo "  */unpack                   - unpack sources"
	@echo "  */patch                    - patch sources"
	@echo "  */build                    - compile package"
	@echo "  */install                  - install package to TOOLCHAIN_DIR"
	@echo "  */clean                    - remove package build directory"
	@echo "  */distclean                - prune package (well, almost)"
	@echo "  */clobber                  - same as distclean"
	@echo
	@echo "Asterisk ('*') denotes toolchain component.  You can also use word 'all'."
	@echo
	@echo "Global target(s):"
	@echo "  toolchain                  - build toolchain"
	@echo
	@echo "Total destruction target(s):"
	@echo "  distclean                  - kill whole toolchain"

help:	all

%/fetch:	%/Makefile
		$(MAKE) -C $* fetch

%/unpack:	%/Makefile
		$(MAKE) -C $* unpack

%/patch:	%/Makefile
		$(MAKE) -C $* patch

%/build:	%/Makefile
		$(MAKE) -C $* build

%/install:	%/Makefile
		$(MAKE) -C $* install

%/clean:	%/Makefile
		$(MAKE) -C $* clean

%/distclean:	%/Makefile
		$(MAKE) -C $* distclean

%/clobber:	%/Makefile
		$(MAKE) -C $* clobber


all/fetch:		$(patsubst %,%/fetch,$(obj-y))
all/unpack:		$(patsubst %,%/unpack,$(obj-y))
all/patch:		$(patsubst %,%/patch,$(obj-y))
all/build:		$(patsubst %,%/build,$(obj-y))
all/install:		$(patsubst %,%/install,$(obj-y))
all/clean:		$(patsubst %,%/clean,$(obj-y))
all/distclean:		$(patsubst %,%/distclean,$(obj-y))
all/clobber:		all/distclean

toolchain:		all/install

distclean:		all/distclean
			rm -rf $(TOOLCHAIN_DIR)
