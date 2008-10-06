# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/delicious/delicious-0.3-r1.ebuild,v 1.3 2008/08/28 07:28:52 ulm Exp $

NEED_EMACS=22

inherit elisp

DESCRIPTION="Emacs client API for del.icio.us"
HOMEPAGE="http://www.wjsullivan.net/delicious-el.html"
SRC_URI="http://www.wjsullivan.net/darcs/delicious-el/delicious-el-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="planner"

DEPEND="planner? ( app-emacs/planner )"

SITEFILE=50${PN}-gentoo.el
DOCS="README"

S="${WORKDIR}/${PN}-el"

src_compile() {
	local FILES="delicioapi.el delicious.el"
	use planner && FILES="${FILES} planner-delicious.el"
	elisp-compile ${FILES} || die "elisp-compile failed"
}