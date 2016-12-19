# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

SCST_VERSION="3.0.1"

DESCRIPTION="Userspace files needed to act as a SCSI target"
HOMEPAGE="https://github.com/cchildress/scst http://scst.sourceforge.net/"
SRC_URI="https://raw.githubusercontent.com/cchildress/scst/master/scstadmin-${SCST_VERSION}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND="dev-lang/perl sys-block/scst sys-kernel/scst-sources"

src_compile() {
	emake all || die
}

src_install() {
	emake install || die
	dodoc README
}
