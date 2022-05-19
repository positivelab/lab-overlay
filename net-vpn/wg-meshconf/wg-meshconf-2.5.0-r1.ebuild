# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Tool to generate peer configuration files for WireGuard mesh networks"
HOMEPAGE="https://github.com/k4yt3x/wg-meshconf"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/prettytable"
RDEPEND="${DEPEND}"
BDEPEND=""
