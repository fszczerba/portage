# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/gradm/gradm-2.1.9.200602141850.ebuild,v 1.7 2007/04/29 15:23:35 phreak Exp $

inherit flag-o-matic toolchain-funcs eutils versionator

myPV="$(replace_version_separator 3 -)"

DESCRIPTION="Administrative interface for the grsecurity Role Based Access Control system"
HOMEPAGE="http://www.grsecurity.net/"
SRC_URI="mirror://gentoo/gradm-${myPV}.tar.gz"
#RESTRICT=primaryuri
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm ia64 ~mips ppc ppc64 s390 sh ~sparc x86"
IUSE="pam"
RDEPEND=""
DEPEND="virtual/libc
	sys-devel/bison
	sys-devel/flex
	pam? ( virtual/pam )
	|| (
		sys-apps/paxctl
		sys-apps/chpax
	)"

S="${WORKDIR}/${PN}2"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/2.1.7.200511041858-non-lazy-bindings.patch
	epatch "${FILESDIR}/${PN}_${PV}-fix-admin-role.patch"
	epatch "${FILESDIR}/${PN}_${PV}-fix-define-order.patch"
}

src_compile() {
	local target=""
	use pam || target="nopam"

	emake ${target} CC="$(tc-getCC)" OPT_FLAGS="${CFLAGS}" || die "compile problem"
}

src_install() {
	einstall DESTDIR="${D}" || die "einstall failed"
	fperms 711 /sbin/gradm
}

pkg_postinst() {
	if [ ! -e "${ROOT}"/dev/grsec ] ; then
		einfo "Making character device for grsec2 learning mode"
		mkdir -p -m 755 "${ROOT}"/dev/
		mknod -m 0622 "${ROOT}"/dev/grsec c 1 13 || die "Cant mknod for grsec learning device"
	fi
	ewarn "Be sure to set a password with 'gradm -P' before enabling learning mode"
}