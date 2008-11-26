# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/mhwaveedit/mhwaveedit-1.4.15-r1.ebuild,v 1.3 2008/11/26 10:05:16 armin76 Exp $

inherit eutils

DESCRIPTION="GTK+ Sound file editor (wav, and a few others.)"
HOMEPAGE="https://gna.org/projects/mhwaveedit"
SRC_URI="http://download.gna.org/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc sparc x86"
IUSE="alsa arts esd jack ladspa libsamplerate nls oss sdl sndfile sox"

RDEPEND=">=x11-libs/gtk+-2
	sndfile? ( >=media-libs/libsndfile-1.0.10 )
	sdl? ( >=media-libs/libsdl-1.2.3 )
	alsa? ( media-libs/alsa-lib )
	jack? ( >=media-sound/jack-audio-connection-kit-0.98.0 )
	esd? ( >=media-sound/esound-0.2.0 )
	libsamplerate? ( media-libs/libsamplerate )
	ladspa? ( media-libs/ladspa-sdk )
	sox? ( media-sound/sox )
	arts? ( >=kde-base/arts-3.4.1 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_compile() {
	econf --without-portaudio \
		$(use_enable nls) \
		$(use_with sndfile libsndfile) \
		$(use_with libsamplerate) \
		$(use_with sdl) \
		$(use_with alsa alsalib) \
		$(use_with oss) \
		$(use_with jack) \
		$(use_with esd esound) \
		$(use_with arts) || die "econf failed."
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS BUGS ChangeLog HACKING NEWS README TODO
}
