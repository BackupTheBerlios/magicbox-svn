PREFIX:=	/usr/local/magicbox/host-i386
DISTDIR:=	$(shell pwd)/../distfiles
HOST:=		i386-linux
BUILD=		$(HOST)
TARGET:=	powerpc-linux

BINUTILS_VER:=	2.15
BINUTILS_TAR=	$(DISTDIR)/binutils-$(BINUTILS_VER).tar.bz2
BINUTILS_CONF=	--prefix=$(PREFIX) --host=$(HOST) --build=$(BUILD) --target=$(TARGET) --enable-shared --disable-nls
BINUTILS_UPSTREAM:=	http://ftp.gnu.org/gnu/binutils/binutils-$(BINUTILS_VER).tar.bz2

GCC_VER:=	3.4.5
GCC_TAR=	$(DISTDIR)/gcc-$(GCC_VER).tar.bz2
GCC_LANGS:=	c
GCC_CONF=	--prefix=$(PREFIX) --host=$(HOST) --build=$(BUILD) --target=$(TARGET) --disable-shared --disable-nls --with-cpu=405 --with-float=soft --enable-languages=$(GCC_LANGS) --disable-__cxa_atexit
GCC_UPSTREAM=	http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VER)/gcc-$(GCC_VER).tar.bz2


all:
	@echo "Available targets:"
	@echo "    binutils  (-$(BINUTILS_VER), -compile, -install, -clean)"
	@echo "    gcc       (-$(GCC_VER), -compile, -install, -clean)"
	@echo "    clean"
	@echo "    clobber"
	@echo "    fetch"


fetch:	
	wget -c $(BINUTILS_UPSTREAM)
	mv -i `basename $(BINUTILS_UPSTREAM)` $(DISTDIR)
	wget -c $(GCC_UPSTREAM)
	mv -i `basename $(GCC_UPSTREAM)` $(DISTDIR)

#
# GNU Binutils
#

binutils:	binutils-compile


binutils-$(BINUTILS_VER):	$(BINUTILS_TAR)
	tar xjvf $(BINUTILS_TAR)


binutils-compile:	binutils-$(BINUTILS_VER)
	mkdir -p binutils-build
	cd binutils-build && \
	../binutils-$(BINUTILS_VER)/configure $(BINUTILS_CONF) && \
	make && \
	touch build-stamp


binutils-install:	binutils-build/build-stamp
	make -C binutils-build install


binutils-clean:
	rm -rf binutils-build


#
# GNU Compiler Collection
#

gcc:	gcc-compile


gcc-$(GCC_VER):	$(GCC_TAR)
	tar xjvf $(GCC_TAR)

gcc-$(GCC_VER)/.patched:	gcc-$(GCC_VER)
	( cd gcc-$(GCC_VER) && patch -p1 <../files/000-gcc-$(GCC_VER)-ld.so-uclibc-for-ppc-and-i386.diff && touch .patched )


gcc-compile:	gcc-$(GCC_VER)/.patched
	mkdir -p gcc-build
	cd gcc-build && \
	../gcc-$(GCC_VER)/configure $(GCC_CONF) && \
	make && \
	touch build-stamp


gcc-install:	gcc-build/build-stamp
	make -C gcc-build install


gcc-clean:
	rm -rf gcc-build


# misc

clean:	binutils-clean gcc-clean

clobber:	clean
	rm -rf binutils-$(BINUTILS_VER) gcc-$(GCC_VER)
