# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games wxwidgets

MY_PN="OpenYahtzee"

DESCRIPTION="A full-featured wxWidgets version of the classic dice game Yahtzee"
HOMEPAGE="http://openyahtzee.sourceforge.net/"
SRC_URI="mirror://sourceforge/openyahtzee/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="unicode"

DEPEND=">=x11-libs/wxGTK-2.6
		>=dev-db/sqlite-3.0"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_PN}

src_compile() {
	WX_GTK_VER=2.6
	if use unicode; then
		need-wxwidgets unicode
	else
		need-wxwidgets gtk2
	fi
	egamesconf
	emake || die "Compile Failed!"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install Failed!"
}
