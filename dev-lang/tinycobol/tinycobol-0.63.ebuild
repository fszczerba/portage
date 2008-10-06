# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/tinycobol/tinycobol-0.63.ebuild,v 1.1 2007/02/26 12:57:20 phosphan Exp $

inherit eutils

DESCRIPTION="COBOL for linux"
HOMEPAGE="http://tiny-cobol.sourceforge.net/"
SRC_URI="mirror://sourceforge/tiny-cobol/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~x86 ~ppc"

RDEPEND=">=dev-libs/glib-2.0
	sys-libs/db"

DEPEND="${RDEPEND}
	sys-devel/flex"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}.patch
}

src_compile() {
	econf || die
	make || die "make failed"
}

src_install() {
	dodir /usr/bin
	dodir /usr/man/man1
	dodir /usr/lib
	dodir /usr/share/htcobol
	make prefix="${D}/usr" install
	dodoc AUTHORS ChangeLog README STATUS
	cd ${D}/usr/lib
	rm libhtcobol.so libhtcobol.so.0
	ln -s libhtcobol.so.0.* libhtcobol.so.0
	ln -s libhtcobol.so.0 libhtcobol.so
}