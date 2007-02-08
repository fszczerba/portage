# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde

DESCRIPTION="small KDE 3.x panel applet that displays the current CPU frequency
similar to the GNOME cpufreq applet"
SRC_URI="http://www.schaffert.eu/download/${PN}/${P}.tar.gz"
HOMEPAGE="http://www.schaffert.eu/projects_html"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="noicon"

DEPEND=">=sys-power/cpufrequtils-0.3-r1"

need-kde 3.3

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"
	use noicon && epatch "${FILESDIR}"/noicon.patch
}
