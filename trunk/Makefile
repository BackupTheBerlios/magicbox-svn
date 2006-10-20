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

fetch:		package/all/fetch
packages:	package/all/package
kernel:		package/kernel/package

image:		packages
		$(FAKEROOT) make -C obj image

world:		fetch packages image
world/clean:	package/all/clean image/clean
world/pkgclean:	package/all/pkgclean
world/distclean:	package/all/distclean image/distclean
world/clobber:		world/distclean

package/%:	
		$(MAKE) -C package $*

image/%:	
		$(MAKE) -C obj $*

.PHONY: all help fetch packages kernel image world world/clean world/distclean world/clobber
