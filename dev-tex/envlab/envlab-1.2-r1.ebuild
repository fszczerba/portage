# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/envlab/envlab-1.2-r1.ebuild,v 1.7 2009/01/07 19:44:42 ranger Exp $

inherit latex-package

S="${WORKDIR}/${PN}"
LICENSE="LPPL-1.2"
DESCRIPTION="A LaTeX module to format envelopes"
HOMEPAGE="http://planck.psu.edu/~boris/"
# downloaded from
# ftp://ftp.ctan.org/pub/tex-archive/macros/latex/contrib/${PN}.tar.gz
SRC_URI="mirror://gentoo/${P}.tar.gz"
SLOT="0"
DEPEND=""
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

TEXMF=/usr/share/texmf-site

src_compile() {
	export VARTEXFONTS="${T}/fonts"
	ebegin "Compiling ${PN}"
	latex envlab.ins || die
	pdflatex elguide.tex || die
	pdflatex elguide.tex || die
	pdflatex envlab.drv || die
	pdflatex envlab.drv || die
	eend
}

src_install() {
	latex-package_src_install

	insinto ${TEXMF}/tex/latex/${PN}
	doins *.cfg

	dodoc readme.v12
}
