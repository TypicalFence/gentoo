# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="dd's x86 CPU Identification tool"

KEYWORDS="amd64 x86"
SLOT="0"
SRC_URI="https://github.com/dd86k/ddcpuid/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
DLANG_VERSION_RANGE="2.075-"
DLANG_PACKAGE_TYPE="single"

inherit dlang

d_src_compile() {
	make release DC="$DC"
}

d_src_install() {
	dobin ddcpuid
	doman ddcpuid.1
}
