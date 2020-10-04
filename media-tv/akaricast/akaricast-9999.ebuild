# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="akaricast client"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ppc ppc64 ~riscv ~s390 sparc x86"
LICENSE="GPL-3"
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

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/click"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	rm -rf akaricastd
	mv akaricast fuck
	rm -rf akaricast
	cp -a  fuck/. .
	rm -rf fuck
}

#python_compile() {
#	distutils-r1_python_install_compile
#}

#python_install() {
#	distutils-r1_python_install
#}

#python_install_all() {
#	distutils-r1_python_install_all
#}
