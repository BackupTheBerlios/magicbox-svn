# pciutils

PKG_NAME:=		pciutils
PKG_VER:=		2.2.4
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://www.kernel.org/pub/software/utils/pciutils/$(PKG_FILE)
#PKG_PACK_DIR:=
PKG_UNPACK:=		tar_gz


define PackagePatch
cd $(PKG_WORKDIR)/lib && sed -e 's/uname -r/echo 2.6.18/' \
  -e 's/uname -m/echo ppc/' -e 's/^zlib=$5/zlib=no/' \
  -e 's@^idsdir=.*@idsdir=/share/pciutils@' <configure >configure.new && \
mv configure.new configure && \
chmod +x configure
endef

define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) OPT="$(PKG_CFLAGS)" PREFIX=/ \
  SHAREDIR=/share/pciutils
endef

define PackageInstall
$(call InstallDir,share/pciutils)
$(call InstallBin,$(PKG_WORKDIR)/lspci,lspci)
$(call InstallSbin,$(PKG_WORKDIR)/setpci,setpci)
$(call InstallMan,$(PKG_WORKDIR)/lspci.man,lspci)
$(call InstallMan,$(PKG_WORKDIR)/setpci.man,setpci)
#call InstallFile,$(PKG_WORKDIR)/pci.ids,share/pciutils,pci.ids,0644
endef

include $(TOPDIR)/include/package.mk
