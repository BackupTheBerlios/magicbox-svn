# linux-2.x

include $(TOPDIR)/Config

ifndef CONFIG_KERNEL_FLAVOUR
$(error "CONFIG_KERNEL_FLAVOUR undefined!  Please use '2.6' or '2.4'")
endif

include ./Makefile-$(CONFIG_KERNEL_FLAVOUR)
