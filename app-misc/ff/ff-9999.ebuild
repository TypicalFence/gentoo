# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple, decent binary file scanner"

KEYWORDS="amd64 x86"
SLOT="0"
SRC_URI="https://github.com/TypicalFence/ff/archive/master.zip -> ${PN}-${PV}.zip"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
		mv  ff-master ff-${PV}
	fi
}

src_compile() {
	make CC=gcc
}

src_install() {
	dobin ff
	doman docs/ff.1
}
