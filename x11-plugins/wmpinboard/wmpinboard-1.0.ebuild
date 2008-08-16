# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmpinboard/wmpinboard-1.0.ebuild,v 1.17 2007/07/22 04:38:25 dberkholz Exp $

inherit eutils

IUSE=""
DESCRIPTION="Window Maker dock applet resembling a miniature pinboard."
SRC_URI="http://dockapps.org/download.php/id/131/${P}.tar.gz"
HOMEPAGE="http://dockapps.org/file.php/id/93"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xproto
	x11-proto/xextproto"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 sparc alpha amd64 ppc"

src_unpack()
{
	unpack ${A}
	cd "${S}"
	epatch ${FILESDIR}/wmpinboard-1.0-segfault.patch
}

src_install ()
{
	make DESTDIR="${D}" install || die "install failed"
}