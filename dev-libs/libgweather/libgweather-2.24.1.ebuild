# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libgweather/libgweather-2.24.1.ebuild,v 1.1 2008/11/06 23:02:03 eva Exp $

EAPI="1"

inherit gnome2

DESCRIPTION="Library to access weather information from online services"
HOMEPAGE="http://www.gnome.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="python"

RDEPEND=">=x11-libs/gtk+-2.11
	>=dev-libs/glib-2.13
	>=gnome-base/gconf-2.8
	net-libs/libsoup:2.4
	>=dev-libs/libxml2-2.6.0
	python? (
		>=dev-python/pygobject-2
		>=dev-python/pygtk-2 )
	!<gnome-base/gnome-applets-2.22.0"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40
	>=dev-util/pkgconfig-0.19"

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS"

pkg_setup() {
	G2CONF="${G2CONF}
		--disable-all-translations-in-one-xml
		$(use_enable python)"
}

pkg_postinst() {
	gnome2_pkg_postinst

	ewarn "Please run revdep-rebuild after upgrading this package."
}