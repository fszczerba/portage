# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/pidgin-facebookchat/pidgin-facebookchat-1.37.ebuild,v 1.2 2008/10/24 21:30:10 pvdabeel Exp $

inherit toolchain-funcs multilib

DESCRIPTION="Facebook chat plugin for libpurple"
HOMEPAGE="http://code.google.com/p/pidgin-facebookchat/"

SRC_URI="http://pidgin-facebookchat.googlecode.com/files/${PN}-source-${PV}.tar.bz2"
LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="net-im/pidgin"
DEPEND="dev-util/pkgconfig
	${RDEPEND}"

S=${WORKDIR}

src_compile() {
	$(tc-getCC) ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} `pkg-config --cflags purple` \
		-DPURPLE_PLUGINS -DENABLE_NLS  -shared -fPIC -DPIC \
		libfacebook.c -o libfacebook.so || die "compilation failed"
}

src_install() {
	exeinto /usr/$(get_libdir)/purple-2
	doexe libfacebook.so
	for size in 16 22 48; do
		insinto /usr/share/pixmaps/pidgin/protocols/${size}
		newins facebook${size}.png facebook.png
	done
}
