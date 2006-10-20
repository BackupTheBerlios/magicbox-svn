# madwifi

include $(TOPDIR)/Config

ifndef CONFIG_MADWIFI_FLAVOUR
$(error "CONFIG_MADWIFI_FLAVOUR undefined!  Please use 'old' or 'ng'")
endif

include ./Makefile-$(CONFIG_MADWIFI_FLAVOUR)
