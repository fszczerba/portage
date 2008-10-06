# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xgamma/xgamma-1.0.2.ebuild,v 1.8 2008/09/24 10:07:50 aballier Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="Alter a monitor's gamma correction through the X server"

KEYWORDS="alpha amd64 arm ~ia64 ~mips ~ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

RDEPEND="x11-libs/libXxf86vm"
DEPEND="${RDEPEND}
	x11-proto/xf86vidmodeproto"