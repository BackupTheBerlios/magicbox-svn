# include/variables.mk
# inherits TOPDIR

BUILDARCH:=		i386-linux
HOSTARCH:=		powerpc-linux

PKG_TOOLCHAIN:=		powerpc-linux-
PKG_CC:=		$(PKG_TOOLCHAIN)gcc
PKG_LD:=		$(PKG_TOOLCHAIN)ld
PKG_AR:=		$(PKG_TOOLCHAIN)ar
PKG_RANLIB:=		$(PKG_TOOLCHAIN)ranlib
PKG_STRIP:=		$(PKG_TOOLCHAIN)strip
PKG_OBJCOPY:=		$(PKG_TOOLCHAIN)objcopy
PKG_CFLAGS:=		-Os

# Directories

BIN_DIR:=		$(TOPDIR)/build/pkg
BUILD_DIR:=		$(TOPDIR)/build/compile
INSTALL_DIR:=		$(TOPDIR)/build/install
STAMP_DIR:=		$(TOPDIR)/build/stamp
TOOLCHAIN_DIR:=		$(TOPDIR)/build/toolchain
FETCH_DIR:=		$(TOPDIR)/fetch
OBJ_DIR:=		$(TOPDIR)/obj
SCRIPTS_DIR:=		$(TOPDIR)/scripts

KERNEL_BUILD_DIR:=	$(BUILD_DIR)/kernel
KERNEL_HEADERS_DIR:=	$(BUILD_DIR)/kernel-headers

PKG_DIR:=		$(shell pwd)
ifndef PKG_FILES_DIR
PKG_FILES_DIR=		$(PKG_DIR)/files
endif
PKG_WORKDIR:=		$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VER)
PKG_FILEPATH:=		$(patsubst %,$(FETCH_DIR)/%,$(PKG_FILE))
PKG_TMP:=		$(INSTALL_DIR)/$(PKG_NAME)
PKG_STAMP:=		$(STAMP_DIR)/$(PKG_NAME)
PKG_BIN:=		$(BIN_DIR)/$(PKG_NAME).tgz

KERNEL_ENV:=		ARCH=ppc CROSS_COMPILE=$(PKG_TOOLCHAIN)
# Do not set -- kernel build will create it with current version
#KERNEL_VER:=
KERNEL_VER_FILE:=	$(BUILD_DIR)/linux-kernel-version

FETCH:=			wget
FETCH_FLAGS:=		-c
FAKEROOT:=		fakeroot
