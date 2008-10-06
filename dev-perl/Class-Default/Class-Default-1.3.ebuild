# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Class-Default/Class-Default-1.3.ebuild,v 1.12 2007/01/19 21:49:06 mcummings Exp $

inherit perl-module

DESCRIPTION="Static calls apply to a default instantiation"
SRC_URI="mirror://cpan/authors/id/A/AD/ADAMK/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~adamk"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 hppa ia64 ~ppc sparc x86"
IUSE=""
SRC_TEST="do"

RDEPEND="dev-perl/Class-Inspector
		dev-perl/ExtUtils-AutoInstall
	dev-lang/perl"
DEPEND="${RDEPEND}
	>=dev-perl/module-build-0.28"