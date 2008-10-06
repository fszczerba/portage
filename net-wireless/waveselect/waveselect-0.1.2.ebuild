# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/waveselect/waveselect-0.1.2.ebuild,v 1.5 2008/08/24 03:33:17 mr_bones_ Exp $

EAPI=1
inherit kde

DESCRIPTION="Waveselect is wireless lan connection tool for Linux using QT and wireless-tools."
HOMEPAGE="http://www.kde-apps.org/content/show.php?content=19152"
SRC_URI="http://kernelpanic.no/waveselect/files/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""
S=${WORKDIR}/${PN}

DEPEND="x11-libs/qt:3"
RDEPEND="${DEPEND}
	net-wireless/wireless-tools"

src_compile() {
	${QTDIR}/bin/qmake -project || die
	${QTDIR}/bin/qmake || die
	emake || die
}

src_install() {
	dobin waveselect || die
	dodoc README
}