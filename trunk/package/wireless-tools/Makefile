# wireless-tools

PKG_NAME:=		wireless-tools
PKG_VER:=		28
PKG_FILE:=		wireless_tools.$(PKG_VER).tar.gz
PKG_SOURCE:=		http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/$(PKG_FILE)
PKG_PACK_DIR:=		wireless_tools.28
PKG_UNPACK:=		tar_gz


define PackageBuild
$(MAKE) -C $(PKG_WORKDIR) CC=$(PKG_CC) AR=$(PKG_AR) RANLIB=$(PKG_RANLIB) PREFIX=/
endef

define PackageInstall
$(call InstallFile,$(PKG_WORKDIR)/libiw.so.28,lib,libiw.so.28,0644)
$(call BinStrip,$(PKG_TMP)/lib/libiw.so.28)
$(call InstallSbin,$(PKG_WORKDIR)/iwconfig,iwconfig)
$(call InstallSbin,$(PKG_WORKDIR)/iwlist,iwlist)
$(call InstallSbin,$(PKG_WORKDIR)/iwpriv,iwpriv)
$(call InstallSbin,$(PKG_WORKDIR)/iwspy,iwspy)
$(call InstallSbin,$(PKG_WORKDIR)/iwevent,iwevent)
$(call InstallSbin,$(PKG_WORKDIR)/iwgetid,iwgetid)
$(call InstallSbin,$(PKG_WORKDIR)/ifrename,ifrename)
$(call InstallMan,$(PKG_WORKDIR)/iwconfig.8,iwconfig)
$(call InstallMan,$(PKG_WORKDIR)/iwlist.8,iwlist)
$(call InstallMan,$(PKG_WORKDIR)/iwpriv.8,iwpriv)
$(call InstallMan,$(PKG_WORKDIR)/iwspy.8,iwspy)
$(call InstallMan,$(PKG_WORKDIR)/iwevent.8,iwevent)
$(call InstallMan,$(PKG_WORKDIR)/iwgetid.8,iwgetid)
$(call InstallMan,$(PKG_WORKDIR)/ifrename.8,ifrename)
$(call InstallMan,$(PKG_WORKDIR)/iftab.5,iftab)
endef

include $(TOPDIR)/include/package.mk
