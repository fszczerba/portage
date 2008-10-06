# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/qt/qt-4.4.1.ebuild,v 1.1 2008/08/11 12:54:56 yngwin Exp $

DESCRIPTION="The Qt toolkit is a comprehensive C++ application development framework."
HOMEPAGE="http://www.trolltech.com/"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="4"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"

IUSE="opengl qt3support"

DEPEND=""
RDEPEND=">=x11-libs/qt-gui-${PV}
	>=x11-libs/qt-svg-${PV}
	>=x11-libs/qt-test-${PV}
	>=x11-libs/qt-sql-${PV}
	>=x11-libs/qt-svg-${PV}
	>=x11-libs/qt-test-${PV}
	>=x11-libs/qt-assistant-${PV}
	>=x11-libs/qt-xmlpatterns-${PV}
	opengl? ( >=x11-libs/qt-opengl-${PV} )
	qt3support? ( >=x11-libs/qt-qt3support-${PV} )"