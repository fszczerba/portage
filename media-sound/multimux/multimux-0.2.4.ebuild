# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/multimux/multimux-0.2.4.ebuild,v 1.3 2007/02/24 18:48:20 aballier Exp $

inherit eutils toolchain-funcs flag-o-matic

IUSE=""

DESCRIPTION="combines up to 8 audio mono wave ch. into one big multi ch. wave file."
HOMEPAGE="http://panteltje.com/panteltje/dvd/"
SRC_URI="http://panteltje.com/panteltje/dvd/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-makefiles.patch"
}

src_compile() {
	append-lfs-flags
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	dobin multimux
	dodoc CHANGES LICENSE README
}