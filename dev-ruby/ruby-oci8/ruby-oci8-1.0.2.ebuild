# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-oci8/ruby-oci8-1.0.2.ebuild,v 1.2 2008/10/06 10:08:41 flameeyes Exp $

inherit ruby

DESCRIPTION="A Ruby library for Oracle"
HOMEPAGE="http://rubyforge.org/projects/ruby-oci8/"
SRC_URI="http://rubyforge.org/frs/download.php/39145/${P}.tar.gz"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

USE_RUBY="ruby18 ruby19"

RDEPEND="dev-db/oracle-instantclient-basic
	dev-db/oracle-instantclient-sqlplus
	virtual/ruby"
DEPEND="${RDEPEND}"

src_compile() {
	emake CONFIG_OPT="--prefix=${D}usr" || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}