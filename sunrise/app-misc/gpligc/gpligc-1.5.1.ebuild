# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PN="GPLIGC"
MY_P=${MY_PN}-${PV}
DESCRIPTION="provides IGC-file (GPS tracklog) evaluation and 3D visualisation"
HOMEPAGE="http://gpligc.sf.net/"
SRC_URI="http://pc12-c714.uibk.ac.at/GPLIGC/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/opengl
	virtual/glut
	virtual/glu
	media-libs/jpeg"
RDEPEND="${DEPEND}
	>=dev-lang/perl-5.6
	dev-perl/perl-tk
	sci-visualization/gnuplot"

# for historical reasons the original tarball has capital letters
# and so has the toplevel directory
S="${WORKDIR}/${MY_P}"

src_compile() {
	# sysinfo.h is created here, to prevent it from being created by the makefile,
	# in a way, which breaks -j n>1  MAKEOPTIONS.
	# shouldn't be needed in gpligc > 1.5.1 anylonger
	echo -n "#define SYSINFO \"" >openGLIGCexplorer/sysinfo.h
	echo -n `uname -a` >>openGLIGCexplorer/sysinfo.h
	echo "\"" >>openGLIGCexplorer/sysinfo.h

	# compiling openGLIGCexplorer using the systems compiler flags
	cd openGLIGCexplorer
	emake CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" || die "Build failed"
}

src_install() {
	# create openGLIGCexplorer data dirs
	keepdir /usr/share/${PN}/data/map
	keepdir /usr/share/${PN}/data/airspace
	keepdir /usr/share/${PN}/data/dem
	keepdir /usr/share/${PN}/data/waypoint

	# install binaries and scripts
	dobin GPLIGC/{GPLIGC.pl,gpsp2igc.pl} \
		openGLIGCexplorer/{openGLIGCexplorer,createworld,etopo2merger,optimizer}

	# install perl modules and icons/pics and example configuration
	insinto /usr/share/${PN}
	doins GPLIGC/{GPLIGCfunctions.pm,GPLIGCwaypoints.pm,gpligc.xbm,icon.png,logo.jpg,logos.gif,logos.jpg} \
		openGLIGCexplorer/.openGLIGCexplorerrc

	dodoc doc/CHANGES

	# at least this pdf is supposed to be used often, so its better left uncompressed
	insinto /usr/share/doc/${P}
	doins doc/GPLIGC_Manual.pdf

	# paths to perl modules have to be set in scripts/modules
	dosed "s:PREFIX:/usr:g" /usr/share/${PN}/.openGLIGCexplorerrc
	dosed "s:zzLIBDIRzz:/usr/share/${PN}/:g" /usr/bin/GPLIGC.pl
	dosed "s:zzLIBDIRzz:/usr/share/${PN}/:g" /usr/share/${PN}/GPLIGCwaypoints.pm

	# some symlinks
	dosym /usr/bin/GPLIGC.pl /usr/bin/GPLIGC
	dosym /usr/bin/openGLIGCexplorer /usr/bin/ogie
}

pkg_postinst() {
	echo
	elog "Information about using and configuring GPLIGC and"
	elog "openGLIGCexplorer (ogie) can be found in the provided manual:"
	elog "/usr/share/doc/${P}/GPLIGC_Manual.pdf"
	elog "Users should copy ogie's example configuration file from"
	elog "/usr/share/${PN}/.openGLIGCexplorerrc to the own HOME directory"
	elog "and edit it according to their needs."
	echo
}
