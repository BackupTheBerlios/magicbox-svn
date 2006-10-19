# include/functions.mk

# InstallDir PATH
define InstallDir
install -d -m755 $(PKG_TMP)/$(1)
endef

# InstallFile WHAT,WHERE,NAME,MODE
define InstallFile
install -d -m755 $(PKG_TMP)/$(2)
install -m$(4) $(1) $(PKG_TMP)/$(2)/$(3)
endef

# InstallBin WHAT,NAME
define InstallBin
install -d -m755 $(PKG_TMP)/bin
install -m755 $(1) $(PKG_TMP)/bin/$(2)
$(call BinStrip,$(PKG_TMP)/bin/$(2))
endef

# InstallSbin WHAT,NAME
define InstallSbin
install -d -m755 $(PKG_TMP)/sbin
install -m755 $(1) $(PKG_TMP)/sbin/$(2)
$(call BinStrip,$(PKG_TMP)/sbin/$(2))
endef

# InstallSymlink WORKDIR,SOURCE,LINK
define InstallSymlink
cd $(PKG_TMP)/$(1) && ln -s $(2) $(3)
endef

# BinStrip WHAT
define BinStrip
$(PKG_STRIP) $(1)
$(PKG_OBJCOPY) -R .note -R .comment $(1)
endef

# InstallMan WHAT,NAME
define InstallMan
install -d -m755 $(PKG_TMP)/share/man
test -f $(1) && man -l $(1) | col -x | gzip -9c > $(PKG_TMP)/share/man/$(2).0.gz
endef
