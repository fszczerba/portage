# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/module-info/module-info-0.30.ebuild,v 1.12 2007/05/12 05:14:36 kumba Exp $

inherit perl-module

MY_PV=${PV/9.0/90}
MY_P="Module-Info-${MY_PV}"
S=${WORKDIR}/${MY_P}
DESCRIPTION="Information about Perl modules"
HOMEPAGE="http://www.cpan.org/modules/by-authors/id/M/MB/MBARBON/${MY_P}.readme"
SRC_URI="mirror://cpan/authors/id/M/MB/MBARBON/${MY_P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 mips ppc ppc64 sparc x86"
IUSE=""

SRC_TEST="do"

DEPEND="dev-perl/module-build
	dev-lang/perl"