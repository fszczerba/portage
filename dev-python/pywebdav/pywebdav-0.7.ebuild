# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pywebdav/pywebdav-0.7.ebuild,v 1.1 2008/05/27 13:26:49 cedk Exp $
# Ebuild generated by g-pypi 0.2.0 (rev. 202)

PYTHON_MODNAME="DAV"

inherit distutils

MY_P=${P/pywebdav/PyWebDAV}

DESCRIPTION="WebDAV server written in python"
HOMEPAGE="http://sourceforge.net/projects/pywebdav/"
SRC_URI="http://pypi.python.org/packages/source/P/PyWebDAV/${MY_P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE=""
DEPEND="dev-python/pyxml"
S="${WORKDIR}/${MY_P}"