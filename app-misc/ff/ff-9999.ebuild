# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple, decent binary file scanner"

KEYWORDS="amd64 x86"
SLOT="0"
EGIT_REPO_URI="https://github.com/dd86k/ff"

case "${PV}" in
	"9999")
		inherit git-r3
		;;
	*)
		0="${PN}-v${PV}"
		SRC_URI="${EGIT_REPO_URI}/-/archive/v${PV}/${P0}.tar.gz -> ${P}.tar.gz"
		S="${WORKDIR}/${P0}"
esac

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	make CC=gcc
}

src_install() {
	dobin ff
	doman docs/ff.1
}
