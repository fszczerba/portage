# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmmisc/wmmisc-1.1.ebuild,v 1.2 2008/06/28 07:06:56 maekke Exp $

inherit eutils toolchain-funcs

DESCRIPTION="a monitoring dockapp for system load, user amount, fork amount and processes."
HOMEPAGE="http://packages.qa.debian.org/w/wmmisc.html"
SRC_URI="mirror://debian/pool/main/w/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

S=${WORKDIR}/${P}/src

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xextproto"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-build.patch
}

src_compile() {
	tc-export CC
	emake || die "emake failed."
}

src_install() {
	dobin ${PN}
	dodoc ../{ChangeLog,README}
}