# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/hashicorp"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1
inherit golang-single

DESCRIPTION="Terraform builds, changes, and combines infrastructure safely and efficiently."
HOMEPAGE="https://www.terraform.io/"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND=">=dev-lang/go-1.7:="

src_install() {
	golang-single_src_install

	dodoc "${S}"/${EGO_PN%/*}/{CHANGELOG.md,.github/CONTRIBUTING.md,README.md}
}
