# Topdir Makefile

TOPDIR=		$(shell pwd)
export TOPDIR

include $(TOPDIR)/include/variables.mk
include $(TOPDIR)/Config


all:
	@echo "Targets:"
	@echo "  fetch                      - fetch sources"
	@echo "  packages                   - make all packages (=y in Config)"
	@echo "  modules                    - make all modules (=m in Config)"
	@echo "  kernel                     - make only kernel"
	@echo "  image                      - build ramdisk image"
	@echo "  world                      - build everything"
	@echo
	@echo "  image/*                    - make image taget *"
	@echo
	@echo "Total destruction targets:"
	@echo "  world/clean                - clean build directiories"
	@echo "  world/pkgclean             - remove tmp binary packages"
	@echo "  world/distclean            - extinguish your world"
	@echo "  world/clobber              - same as world/distclean"


help:	all

fetch:		package/all/fetch
packages:	package/all/package
modules:	package/mod/package
kernel:		package/kernel/package

image:		packages
		$(FAKEROOT) make -C obj image

world:		fetch packages modules image
world/clean:	package/all/clean package/mod/clean image/clean
world/pkgclean:	package/all/pkgclean package/mod/pkgclean
		rm -f $(BIN_DIR)/*
world/distclean:	package/all/distclean package/mod/distclean image/distclean
world/clobber:		world/distclean

package/%:	
		$(MAKE) -C package $*

module/%:	
		$(MAKE) -C package $(patsubst %,%-mod,$*)
image/%:	
		$(MAKE) -C obj $*

.PHONY: all help fetch packages kernel image world world/clean world/distclean world/clobber
