# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Night Light multi-user IRC proxy/bouncer"
HOMEPAGE="http://www.ircproxy.night-light.net/"
SRC_URI="mirror://sourceforge/ircproxy/${P}.tar.gz"
IUSE="ssl ipv6 memdebug fddebug debug identd"
KEYWORDS="~x86"
SLOT="0"
LICENSE="GPL-2"
# Options: ssl, ipv6 memdebug fddebug
# depends: c-ares, ssl? openssl

# possibly >=net-dns/c-ares-1.5.1
DEPEND="net-dns/c-ares
		ssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable ssl) \
		$(use_enable ipv6) \
		$(use_enable identd) \
		$(use_enable memdebug) \
		$(use_enable fddebug) \
		$(use_enable debug) \
		|| die "Configure failed!"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS BUGS ChangeLog FAQ FEATURES INSTALL README || die
	dodir /etc/ircproxy/
	doins data/*
}

pkg_postinst() {
	elog "You will need to set up an ircproxyd.conf before running ircproxyd."
	elog "A sample ircproxyd.conf is installed in /usr/share/ircproxy."
}
