# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jcs/jcs-1.2.7.9.ebuild,v 1.5 2007/05/06 09:33:17 dertobi123 Exp $

inherit java-pkg-2 java-ant-2

DESCRIPTION="JCS is a distributed caching system written in java for server-side java applications"
HOMEPAGE="http://jakarta.apache.org/jcs/"
# Yes, it's a checkout from JCS SVN...
#  http://svn.apache.org/repos/asf/jakarta/jcs/tags/
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="1.2"
KEYWORDS="amd64 ppc x86"
IUSE="admin doc source"

RDEPEND=">=virtual/jre-1.4
	=dev-java/jisp-2.5*
	=dev-java/servletapi-2.3*
	dev-db/hsqldb
	dev-java/commons-dbcp
	=dev-java/commons-lang-2.0*
	dev-java/commons-logging
	dev-java/commons-pool
	dev-java/concurrent-util
	dev-java/jgroups
	dev-java/xmlrpc
	admin? ( dev-java/velocity )"
DEPEND=">=virtual/jdk-1.4
	dev-java/ant-core
	source? ( app-arch/zip )
	${RDEPEND}"

LIBRARY_PKGS="jgroups,servletapi-2.3,commons-lang,commons-logging,commons-pool,commons-dbcp,xmlrpc,concurrent-util,jisp-2.5,hsqldb"

src_unpack() {
	unpack ${A}

	cd "${S}"

	# use our own build.xml because jcs's is demented by maven
	cp "${FILESDIR}/build-${PV}.xml" build.xml

	if use admin; then
		LIBRARY_PKGS="${LIBRARY_PKGS},velocity"
	else
		ewarn
		ewarn "JCS Admin is disabled, if you want it hit Ctrl-C and add"
		ewarn "\"admin\" USE flag."
		ewarn
		rm -fr ${S}/src/java/org/apache/jcs/admin
	fi

	cat > build.properties <<-END
		classpath=$(java-pkg_getjars ${LIBRARY_PKGS})
	END
}

src_compile() {
	eant jar -Dproject.name=${PN} $(use_doc)
}

src_install() {
	java-pkg_dojar dist/${PN}.jar

	use doc && java-pkg_dojavadoc dist/doc/api
	use source && java-pkg_dosrc src/java/*
}