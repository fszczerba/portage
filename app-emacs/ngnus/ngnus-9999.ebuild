# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/ngnus/ngnus-9999.ebuild,v 1.2 2007/12/01 16:09:49 ulm Exp $

ECVS_SERVER="cvs.gnus.org:/usr/local/cvsroot"
ECVS_MODULE="gnus"
ECVS_USER="gnus"
ECVS_PASS="gnus"
ECVS_CVS_OPTIONS="-dP"

inherit elisp cvs

DESCRIPTION="Current alpha branch of the Gnus news- and mail-reader"
HOMEPAGE="http://gnus.org/"
SRC_URI=""

LICENSE="GPL-3 FDL-1.2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~alpha ~sparc ~amd64"
IUSE=""

DEPEND=""
RDEPEND="!app-emacs/gnus
	!app-emacs/gnus-cvs"

S="${WORKDIR}/${ECVS_MODULE}"
SITEFILE=70${PN}-gentoo.el

src_compile() {
	econf \
		--with-emacs --without-w3 --without-url \
		--with-lispdir=${SITELISP}/${PN} \
		--with-etcdir=${SITEETC} \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall \
		lispdir="${D}${SITELISP}/${PN}" \
		etcdir="${D}${SITEETC}" \
		|| die "einstall failed"

	# fix info documentation
	for i in "${D}"/usr/share/info/*; do
		mv "${i}" "${i}".info || die "mv info failed"
	done

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" \
		|| die "elisp-site-file-install failed"

	dodoc ChangeLog GNUS-NEWS README todo || die "dodoc failed"
}