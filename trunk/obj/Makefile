# obj/Makefile

TOPDIR:=		$(shell pwd)/..
export TOPDIR

include $(TOPDIR)/include/variables.mk
include $(TOPDIR)/Config

IMAGE_DIR:=	$(TOPDIR)/build/image
PACKAGES:=	$(wildcard $(BIN_DIR)/*.tgz)

all:
		@echo "Target(s):"
		@echo "  image                      - build ramdisk image"
		@echo "  clean                      - remove tmp directory"
		@echo "  distclean                  - remove image"
		@echo

checkroot:
		if [ `id -u` -ne 0 ]; \
		   then \
		   echo "You must be root (or use fakeroot).  Aborting." 1>&2;\
		   exit 1; \
		fi

image:		checkroot image/build

image/prepare: checkroot $(PACKAGES)
		rm -rf $(IMAGE_DIR)
		mkdir -p $(IMAGE_DIR)

image/install:	checkroot image/prepare $(patsubst %,%/install,$(notdir $(PACKAGES)))

image/postinstall:	checkroot image/install
		date +%m%d%H%M%Y >> $(IMAGE_DIR)/etc/magicbox_version
		date +%m%d%H%M%Y >> $(IMAGE_DIR)/etc/builddate
ifeq ($(IMAGE_NO_CATMAN),y)
		rm -f $(IMAGE_DIR)/share/man/*
endif
ifeq ($(CONFIG_KERNEL_FLAVOUR),2.6)
		cd $(IMAGE_DIR) && /sbin/depmod -b . "`basename ./lib/modules/*`"
		rm -f $(IMAGE_DIR)/lib/modules/*/modules.[b-ce-rt-z]*
		rm -f $(IMAGE_DIR)/lib/modules/*/modules.seriomap*
		rm -rf $(IMAGE_DIR)/lib/modules/*/external || true
else
		rm -f $(IMAGE_DIR)/lib/modules/*/modules.*
endif

image/build:	checkroot image/postinstall
ifeq ($(IMAGE_FORMAT_SQUASHFS),y)
		cd $(IMAGE_DIR) && mksquashfs . $(TOPDIR)/build/image.bin -be -all-root
		mkimage -A ppc -O linux -T ramdisk -C none -n "image-`basename $(IMAGE_DIR)/lib/modules/*`" -d $(TOPDIR)/build/image.bin $(OBJ_DIR)/image.squashfs
		rm $(TOPDIR)/build/image.bin
endif

%/install:	$(BIN_DIR)/%
		cd $(TOPDIR)/build/image && tar xzf $(BIN_DIR)/$*

clean:
		rm -rf $(IMAGE_DIR)

distclean:	clean
		rm -f image*

clobber:	distclean


.PHONY: checkroot image image/prepare image/install image/postinstall image/build clean distclean clobber
