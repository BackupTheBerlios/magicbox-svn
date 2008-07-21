# madwifi

include $(TOPDIR)/Config

ifndef CONFIG_MADWIFI_FLAVOUR
$(error "CONFIG_MADWIFI_FLAVOUR undefined!  Please use 'old', 'ng' or 'ng-svn'")
endif

include ./Makefile-$(CONFIG_MADWIFI_FLAVOUR)
