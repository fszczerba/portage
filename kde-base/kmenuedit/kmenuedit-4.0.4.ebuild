# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kmenuedit/kmenuedit-4.0.4.ebuild,v 1.1 2008/05/15 23:54:47 ingmar Exp $

EAPI="1"

KMNAME=kdebase-workspace
inherit kde4-meta

DESCRIPTION="KDE menu editor"
KEYWORDS="~amd64 ~x86"
IUSE="debug htmlhandbook"

KMEXTRACTONLY="menu"