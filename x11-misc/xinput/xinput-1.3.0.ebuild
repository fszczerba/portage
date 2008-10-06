# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xinput/xinput-1.3.0.ebuild,v 1.5 2008/10/03 08:49:41 armin76 Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="Utility to set XInput device parameters"
SRC_URI="http://xorg.freedesktop.org/archive/individual/app/${P}.tar.bz2"
LICENSE="as-is"
KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~sparc ~x86 ~x86-fbsd"
IUSE=""
RDEPEND="x11-libs/libXi"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-1.4"