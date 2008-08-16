# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/openipmi/openipmi-1.4.12.ebuild,v 1.3 2008/05/18 13:15:42 drac Exp $

DESCRIPTION="Library interface to IPMI"
HOMEPAGE="http://sourceforge.net/projects/${PN}/"
MY_PN="OpenIPMI"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1 GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="crypt snmp perl"
S="${WORKDIR}/${MY_P}"

RDEPEND="virtual/libc
	dev-libs/glib
	sys-libs/gdbm
	crypt? ( dev-libs/openssl )
	snmp? ( net-analyzer/net-snmp )
	perl? ( dev-lang/perl )"
DEPEND="${RDEPEND}
	>=dev-lang/swig-1.3.21
	dev-util/pkgconfig"

src_compile() {
	local myconf=""
	myconf="${myconf} `use_with snmp ucdsnmp yes`"
	myconf="${myconf} `use_with crypt openssl yes`"
	myconf="${myconf} `use_with perl perl yes`"
	myconf="${myconf} --with-swig=yes --with-glib=yes"
	# these binaries are for root!
	econf ${myconf} --bindir=/usr/sbin || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc README* FAQ ChangeLog TODO doc/IPMI.pdf lanserv/README.emulator
	newdoc cmdlang/README README.cmdlang
}