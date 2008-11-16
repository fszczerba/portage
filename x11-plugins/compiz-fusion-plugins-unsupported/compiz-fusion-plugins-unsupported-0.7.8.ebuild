# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/compiz-fusion-plugins-unsupported/compiz-fusion-plugins-unsupported-0.7.8.ebuild,v 1.3 2008/11/15 02:16:33 jmbsvicetto Exp $

EAPI="2"

DESCRIPTION="Compiz Fusion Window Decorator Unsupported Plugins"
HOMEPAGE="http://compiz-fusion.org"
SRC_URI="http://releases.compiz-fusion.org/${PV}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=gnome-base/librsvg-2.14.0
	media-libs/jpeg
	~x11-libs/compiz-bcop-${PV}
	~x11-wm/compiz-${PV}
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.19
	>=sys-devel/gettext-0.15
	x11-libs/cairo[glitz]
"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
