# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

DESCRIPTION="Userspace files needed to act as a SCSI target"
HOMEPAGE="http://scst.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/project/scst/scst/scst-3.0.1.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fscst%2Ffiles%2Fscst%2F&ts=1425172125&use_mirror=hivelocity"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 !x86"
RESTRICT="mirror"

DEPEND="sys-kernel/scst-sources"

MODULE_NAMES="scst"
CONFIG_CHECK="BLK_DEV_SD CFQ CRYPTO_CRC32C IOSCHED_CFQ INET PREEMPT_NONE TCP_ZERO_COPY_TRANSFER_COMPLETION_NOTIFICATION"
ERROR_CFG="The following options must be set in the kernel:
	BLK_DEV_SD CFQ CRYPTO_CRC32C IOSCHED_CFQ INET PREEMPT_NONE TCP_ZERO_COPY_TRANSFER_COMPLETION_NOTIFICATION"

src_prepare() {
}

src_compile() {
	
}

src_install() {
}
