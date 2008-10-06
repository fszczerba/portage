# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/sdb/sdb-1.0.2.ebuild,v 1.7 2008/04/30 22:07:30 nyhm Exp $

inherit eutils games

DESCRIPTION="a 2D top-down action game; escape a facility full of walking death machines"
HOMEPAGE="http://sdb.gamecreation.org/"
SRC_URI="http://gcsociety.sp.cs.cmu.edu/~frenzy/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND="virtual/opengl
	media-libs/libsdl
	media-libs/sdl-image
	media-libs/sdl-mixer"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e "s:models/:${GAMES_DATADIR}/${PN}/models/:" \
		-e "s:snd/:${GAMES_DATADIR}/${PN}/snd/:" \
		-e "s:sprites/:${GAMES_DATADIR}/${PN}/sprites/:" \
		-e "s:levels/:${GAMES_DATADIR}/${PN}/levels/:" \
		src/sdb.h src/game.cpp || die "setting game paths"
	epatch \
		"${FILESDIR}"/${P}-endian.patch \
		"${FILESDIR}"/${P}-gcc43.patch
}

src_compile() {
	emake \
		-C src \
		CXXFLAGS="${CXXFLAGS} $(sdl-config --cflags)" \
		|| die "emake failed"
}

src_install() {
	dogamesbin src/sdb || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r levels models snd sprites || die "doins failed"
	newicon sprites/barrel.png ${PN}.png
	make_desktop_entry sdb "Shotgun Debugger"
	dodoc ChangeLog README
	prepgamesdirs
}