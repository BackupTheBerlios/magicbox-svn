# Topdir Makefile

TOPDIR=		$(shell pwd)
export TOPDIR

include $(TOPDIR)/include/variables.mk
include $(TOPDIR)/Config


all:
	@echo "Targets:"
	@echo "  fetch                      - fetch sources"
	@echo "  packages                   - make all packages (includes kernel)"
	@echo "  kernel                     - make only kernel"
	@echo "  image                      - build ramdisk image"
	@echo "  world                      - build everything"
	@echo
	@echo "  package/*                  - make package target *"
	@echo "  image/*                    - make image taget *"
	@echo
	@echo "Total destruction targets:"
	@echo "  world/clean                - clean build directiories"
	@echo "  world/pkgclean             - remove tmp binary packages"
	@echo "  world/distclean            - extinguish your world"
	@echo "  world/clobber              - same as world/distclean"


help:	all

fetch:
		$(MAKE) -C packages all/fetch

packages:
		$(MAKE) -C packages all/package

kernel:
		$(MAKE) -C packages kernel/package

image:		packages
		$(FAKEROOT) make -C obj image

world:		fetch packages image

world/clean:	
		$(MAKE) -C packages all/clean
		$(MAKE) -C obj clean

world/pkgclean:	
		$(MAKE) -C packages all/pkgclean

world/distclean:	
		$(MAKE) -C packages all/distclean
		$(MAKE) -C obj distclean

world/clobber:		world/distclean

package/%:	
		$(MAKE) -C packages $*

image/%:	
		$(MAKE) -C obj $*

.PHONY: all help fetch packages kernel image world world/clean world/distclean world/clobber
