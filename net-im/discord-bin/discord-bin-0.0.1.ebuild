# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="All-in-one voice and text chat for gamers."
HOMEPAGE="https://discordapp.com/"
SRC_URI="https://dl.discordapp.net/apps/linux/${PV}/discord-${PV}.tar.gz"

LICENSE="discord-2015-09-12"
SLOT="0"
KEYWORDS="~amd64"

INSTALL_DIR="/opt/Discord"
S="${WORKDIR}/Discord"

pkg_pretend() {
	# Protect against people using autounmask overzealously
	use amd64 || die "discord only works on amd64"
}

src_compile() {
	:
}

src_install() {
	dodir "${INSTALL_DIR}"
	cp -R "${S}" "${D}/opt/" || die "Install failed!"
	dosym "${INSTALL_DIR}/Discord" "/opt/bin/Discord"
}
