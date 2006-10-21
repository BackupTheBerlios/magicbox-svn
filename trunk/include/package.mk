# include/package.mk

include $(TOPDIR)/include/variables.mk
include $(TOPDIR)/include/functions.mk

.PHONY:	package install build patch unpack fetch clean distclean clobber

## RULES ###############################################################
package:		$(PKG_BIN)

$(PKG_BIN):		$(PKG_STAMP)/.install
ifneq ($(PKG_NO_BINARY),yes)
			cd $(PKG_TMP) && \
			$(FAKEROOT) /bin/sh -ec "$(SCRIPTS_DIR)/fix-perms.sh $(PKG_TMP) $(PKG_DIR)/$(PKG_NAME).perm && tar czf $(PKG_BIN) ."
endif
ifdef PackagePackage
			$(call PackagePackage)
endif

# INSTALL ##############################################################
install:		$(PKG_STAMP)/.install

$(PKG_STAMP)/.install:	$(PKG_STAMP)/.build
ifneq ($(PKG_TOOLCHAIN),yes)
			rm -rf $(PKG_TMP)
			install -d -m755 $(PKG_TMP)
else
			install -d -m755 $(TOOLCHAIN_DIR)
endif
ifdef PackageInstall
			$(call PackageInstall)
endif
			touch $(PKG_STAMP)/.install

# BUILD
build:			$(PKG_STAMP)/.build

$(PKG_STAMP)/.build:	$(PKG_STAMP)/.patch
ifdef PackageBuild
			$(call PackageBuild)
endif
			touch $(PKG_STAMP)/.build

# PATCH ################################################################
patch:			$(PKG_STAMP)/.patch

$(PKG_STAMP)/.patch:	$(PKG_STAMP)/.unpack
ifdef PackagePatch
			$(call PackagePatch)
endif
			touch $(PKG_STAMP)/.patch

# UNPACK ###############################################################
unpack:			$(PKG_STAMP)/.unpack

$(PKG_STAMP)/.unpack:	$(PKG_FILEPATH)
			mkdir -p $(BUILD_DIR)/unpacking
			rm -rf $(PKG_WORKDIR) $(BUILD_DIR)/$(PKG_NAME)
ifeq ($(PKG_UNPACK),tar_gz)
			cd $(BUILD_DIR)/unpacking && tar xzf $(word 1,$(PKG_FILEPATH))
endif
ifeq ($(PKG_UNPACK),tar_bz2)
			cd $(BUILD_DIR)/unpacking && tar xjf $(word 1,$(PKG_FILEPATH))
endif
ifeq ($(PKG_UNPACK),zip)
			cd $(BUILD_DIR)/unpacking && unzip $(word 1,$(PKG_FILEPATH))
endif
ifdef PKG_PACK_DIR
			cd $(BUILD_DIR)/unpacking && mv $(PKG_PACK_DIR) $(PKG_WORKDIR)
else
ifdef PKG_UNPACK
			cd $(BUILD_DIR)/unpacking && mv $(PKG_NAME)-$(PKG_VER) $(PKG_WORKDIR)
endif
endif
			cd $(BUILD_DIR) && ln -s $(PKG_WORKDIR) $(PKG_NAME)
ifdef PackageUnpack
			$(call PackageUnpack)
endif
			mkdir -p $(PKG_STAMP)
			touch $(PKG_STAMP)/.unpack

# FETCH ################################################################
fetch:			$(PKG_FILEPATH)

$(PKG_FILEPATH):
ifdef PKG_SOURCE
			cd $(FETCH_DIR) && $(FETCH) $(FETCH_FLAGS) $(PKG_SOURCE)
endif
ifdef PackageFetch
			$(call PackageFetch)
endif

# CLEAN ################################################################
clean:
			rm -rf $(PKG_WORKDIR) $(PKG_TMP) $(BUILD_DIR)/$(PKG_NAME) $(BUILD_DIR)/unpacking
ifdef PackageClean
			$(call PackageClean)
endif

pkgclean:
ifneq ($(PKG_TOOLCHAIN),yes)
			rm -rf $(PKG_BIN)
endif
ifdef PackagePkgClean
			$(call PackagePkgClean)
endif

distclean:		clean pkgclean
			rm -rf $(PKG_STAMP)
ifdef PackageDistclean
			$(call PackageDistclean)
endif

clobber:		distclean
