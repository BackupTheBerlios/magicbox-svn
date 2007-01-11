# magicbox-tools

PKG_NAME:=		magicbox-tools
PKG_VER:=		current


define PackageInstall
$(call InstallFile,$(PKG_FILES_DIR)/firmware,sbin,firmware,0755)
$(call InstallFile,$(PKG_FILES_DIR)/persistent-save,sbin,persistent-save,0755)
$(call InstallFile,$(PKG_FILES_DIR)/persistent-reset,sbin,persistent-reset,0755)
$(call InstallFile,$(PKG_FILES_DIR)/ping-wdt,sbin,ping-wdt,0755)
$(call InstallFile,$(PKG_FILES_DIR)/man,bin,man,0755)
endef

include $(TOPDIR)/include/package.mk
