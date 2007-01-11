# hotplug

PKG_NAME:=		hotplug
PKG_VER:=		2004_09_23
PKG_FILE:=		$(PKG_NAME)-$(PKG_VER).tar.gz
PKG_SOURCE:=		http://ftp.kernel.org/pub/linux/utils/kernel/hotplug/$(PKG_FILE)
PKG_UNPACK:=		tar_gz


define PackageBuild
sed -e 's@FIRMWARE_DIR=.*@FIRMWARE_DIR=/var/firmware@g' <$(PKG_WORKDIR)/etc/hotplug/firmware.agent >$(PKG_WORKDIR)/etc/hotplug/firmware.agent.tmp
mv $(PKG_WORKDIR)/etc/hotplug/firmware.agent.tmp $(PKG_WORKDIR)/etc/hotplug/firmware.agent
endef

define PackageInstall
$(call InstallDir,var/firmware)
$(call InstallFile,$(PKG_WORKDIR)/sbin/hotplug,sbin,hotplug,0755)
$(call InstallFile,$(PKG_WORKDIR)/etc/hotplug.d/default/default.hotplug,etc/hotplug.d/default,default.hotplug,0755)
$(call InstallFile,$(PKG_WORKDIR)/etc/hotplug/hotplug.functions,etc/hotplug,hotplug.functions,0644)
$(call InstallFile,$(PKG_WORKDIR)/etc/hotplug/firmware.agent,etc/hotplug,firmware.agent,0755)
endef

include $(TOPDIR)/include/package.mk
