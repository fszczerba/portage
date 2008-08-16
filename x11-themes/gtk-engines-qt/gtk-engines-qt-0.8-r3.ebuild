# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gtk-engines-qt/gtk-engines-qt-0.8-r3.ebuild,v 1.1 2008/08/14 06:53:44 wormo Exp $

ARTS_REQUIRED="never"

inherit kde cmake-utils

MY_PN="gtk-qt-engine"
DESCRIPTION="GTK+2 Qt 3 Theme Engine"
HOMEPAGE="http://gtk-qt.ecs.soton.ac.uk"
SRC_URI="http://gtk-qt.ecs.soton.ac.uk/files/${PV}/${MY_PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

IUSE="gnome"

LANGS="bg de es fr it nn ru sv tr"
for X in ${LANGS}; do IUSE="${IUSE} linguas_${X}"; done

COMMONDEPEND=">=x11-libs/gtk+-2.2
	gnome? ( =gnome-base/libbonoboui-2* )"

DEPEND="${COMMONDEPEND}
	dev-util/cmake"
# the little gnome_apps.png...
RDEPEND="${COMMONDEPEND}
	|| ( =kde-base/kdebase-data-3.5* =kde-base/kdebase-3.5* )"
need-kde 3.5

# Set slot after the need-kde. Fixes bug #78455.
SLOT="2"

S="${WORKDIR}/${MY_PN}"

PATCHES="${FILESDIR}/gtk-engines-qt-0.8-konq-flash.patch
	${FILESDIR}/gtk-engines-qt-0.8-optional-bonobo.patch"

src_compile() {
	# enable or disable bonobo support based on gnome useflag (bug #206568)
	mycmakeargs="${mycmakeargs}
		$(cmake-utils_use_enable gnome BONOBO)"
	cmake-utils_src_compile
}

src_install() {
	kde_src_install
	mv "${D}"/usr/local/share/applications "${D}"/usr/share/ || die

	# only install requested translations (bug #205940)
	strip-linguas ${LANGS}
	dodir /usr/share/locale
	for lang in ${LINGUAS}; do
		mv "${D}"/usr/local/share/locale/$lang "${D}"/usr/share/locale || die
	done
	rm -rf "${D}"/usr/local/share
}