# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${PN}081"
S=${WORKDIR}/${MY_P}

DESCRIPTION="Picture manager / organizer written in Perl/Tk."
HOMEPAGE="http://mapivi.sourceforge.net/mapivi.shtml"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/perl-5.5
	>=dev-perl/perl-tk-804.027
	>=dev-perl/Image-MetaData-JPEG-0.14
	dev-perl/ImageInfo"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i -e 's:$configdir/PlugIns:/usr/share/mapivi/plugins:' mapivi
}

src_install() {
	dobin mapivi
	dodir /usr/share/mapivi/plugins
	exeinto /usr/share/mapivi/plugins
	doexe PlugIns/{Channel-Separator,Join-RGB,checkDir-plugin,filelist-plugin,test-plugin}
	dodoc Changes.txt FAQ README Tips.txt ToDo
}
