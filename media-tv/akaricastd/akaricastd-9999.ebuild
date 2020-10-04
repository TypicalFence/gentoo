# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="akaricast daemon"

KEYWORDS="amd64 x86 arm"
LICENSE="GPL-3.0"
SLOT="0"
EGIT_REPO_URI="https://github.com/TypicalFence/akaricast"

case "${PV}" in
	"9999")
		inherit git-r3
		;;
	*)
		0="${PN}-v${PV}"
		SRC_URI="${EGIT_REPO_URI}/-/archive/v${PV}/${P0}.tar.gz -> ${P}.tar.gz"
		S="${WORKDIR}/${P0}"
esac


DLANG_VERSION_RANGE="2.075-"
DLANG_PACKAGE_TYPE="single"

inherit dlang

DEPEND="dev-util/dub"
RDEPEND="media-video/mpv[+libmpv]"

d_src_compile() {
	cd akaricastd
	dub build --build=release --compiler=${DC}
}

d_src_install() {
	dobin akaicastd/akaricastd
}
