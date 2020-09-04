# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Interactive hexadecimal file viewer for your terminal"

KEYWORDS="amd64 x86"
SLOT="0"
SRC_URI="https://github.com/dd86k/ddhx/archive/v${PV}.zip -> ${PN}-${PV}.zip"

DLANG_VERSION_RANGE="2.075-"
DLANG_PACKAGE_TYPE="single"

inherit dlang

DEPEND="dev-util/dub"
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
		mv ddhx-master ddhx-${PV}
	fi
}

d_src_compile() {
	dub build --build=release --compiler=${DC}
}

d_src_install() {
	dobin ddhx
	doman docs/ddhx.1
}
