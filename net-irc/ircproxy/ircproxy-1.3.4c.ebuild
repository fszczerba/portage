# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils

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

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i -e '
			s:/usr/share/:/etc/:g;
			s:EGROUP="users":EGROUP="ircproxy":;
			s:\(PIDFILE=.*\):# Set the pidfile in /etc/conf.d/ircproxy.conf\n#\1:;
		' \
		data/ircproxyd.conf || die "sed failed!"

	use ssl || sed -i -e 's:^SSL:#SSL:' \
			-s 's:#SSLSUPPORT=.*:SSLSUPPORT=no:' \
			data/ircproxyd.conf || die "sed for !ssl failed!"
}

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

	newconfd "${FILESDIR}"/ircproxyd.conf ircproxyd
	newinitd "${FILESDIR}"/ircproxyd.init ircproxyd

	# put config files in /etc/ircproxy
	insinto /etc/${PN}/
	doins data/*

	# rename example conf files
	for f in "${D}/usr/share/${PN}"/*.conf ; do
		mv "${f}" "${f}.example" || die "mv "${f}" "${f}.example" failed!"
	done

	if use ssl ; then
		diropts -m0750 --owner=ircproxy --group=ircproxy
		dodir /etc/${PN}/cert
	fi
}

pkg_setup() {
	enewgroup ircproxy
	enewuser ircproxy -1 -1 -1 ircproxy
}
