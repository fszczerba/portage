# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Command line interface to http://rafb.net/paste written in Perl"
HOMEPAGE="http://allenjb.me.uk/"
SRC_URI="http://allenjb.me.uk/files/${PN}.tbz2"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""
SLOT="0"
DEPEND=""
RDEPEND="dev-lang/perl
	dev-perl/libwww-perl
	dev-perl/AppConfig"

S=${WORKDIR}/${PN}

src_install() {
	dobin ${PN}
}
