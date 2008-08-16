# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/fortune-mod-scriptures/fortune-mod-scriptures-1.1.0.ebuild,v 1.5 2008/01/30 16:38:14 nyhm Exp $

DESCRIPTION="Fortune modules from the King James Bible scriptures"
HOMEPAGE="http://scriptures.nephi.org/"
SRC_URI="mirror://sourceforge/mormon/${P}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="games-misc/fortune-mod"

src_install() {
	dodoc README ChangeLog
	insinto /usr/share/fortune
	doins mods/* || die
}