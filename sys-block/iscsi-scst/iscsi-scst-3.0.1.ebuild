# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

SCST_VERSION="3.0.1"

DESCRIPTION="Userspace files needed to act as a SCSI target"
HOMEPAGE="https://github.com/cchildress/scst http://scst.sourceforge.net/"
SRC_URI="https://raw.githubusercontent.com/cchildress/scst/master/iscsi-scst-${SCST_VERSION}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND="sys-block/scst sys-kernel/scst-sources"

MODULE_NAMES="iscsi-lsmoscst"
CONFIG_CHECK="BLK_DEV_SD CRYPTO_CRC32C DEFAULT_CFQ IOSCHED_CFQ INET PREEMPT_NONE TCP_ZERO_COPY_TRANSFER_COMPLETION_NOTIFICATION"
ERROR_CFG="The following options must be set in the kernel: BLK_DEV_SD CRYPTO_CRC32C DEFAULT_CFQ IOSCHED_CFQ INET PREEMPT_NONE TCP_ZERO_COPY_TRANSFER_COMPLETION_NOTIFICATION"

src_compile() {
        ARCH="x86_64"
        emake all KVER=${KV_FULL}|| die
}

src_install() {
	dodoc README
}
