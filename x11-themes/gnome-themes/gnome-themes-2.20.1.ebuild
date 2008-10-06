# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gnome-themes/gnome-themes-2.20.1.ebuild,v 1.9 2008/08/12 22:21:24 leio Exp $

inherit gnome2

DESCRIPTION="A set of GNOME themes, with sets for users with limited or low vision"
HOMEPAGE="http://www.gnome.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="arm sh"
IUSE="accessibility"

RDEPEND=">=x11-libs/gtk+-2
	 >=x11-themes/gtk-engines-2.9"
DEPEND="${RDEPEND}
	>=x11-misc/icon-naming-utils-0.8.0
	>=dev-util/pkgconfig-0.9
	>=dev-util/intltool-0.35"

DOCS="AUTHORS ChangeLog NEWS README"

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

pkg_setup() {
	G2CONF="${G2CONF} $(use_enable accessibility all-themes)"
}