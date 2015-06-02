# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="14"
K_DEBLOB_AVAILABLE="0"
UNIPATCH_STRICTORDER=1
inherit kernel-2
detect_version
detect_arch

SCST_URI="https://raw.githubusercontent.com/cchildress/scst/master/scst-patches-${KV_MAJOR}.${KV_MINOR}.tar.bz2"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree and SCST support"
HOMEPAGE="https://github.com/cchildress/gentoo-overlay http://scst.sourceforge.net/"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${SCST_URI}"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="deblob iscsi experimental"

src_unpack() {
	if use iscsi; then
		UNIPATCH_LIST=${WORKDIR}"/put_page_callback-3.18.patch"
	fi
	UNIPATCH_LIST+=" "${WORKDIR}"/cst_exec_req_fifo-3.18.patch"

	kernel-2_src_unpack
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
	has_version sys-block/scst || \
		elog "In order to use the SCST patches you need to install sys-block/scst"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
