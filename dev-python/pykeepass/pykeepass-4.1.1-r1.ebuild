# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python library to interact with keepass databases (supports KDBX3 and KDBX4)"
HOMEPAGE="
	https://github.com/libkeepass/pykeepass/
	https://pypi.org/project/pykeepass/
"

SRC_URI="$(pypi_sdist_url "${PN}" "${PV}.post1")"
S="${WORKDIR}/${P}.post1"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.70[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.3.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

src_prepare() {
	distutils-r1_src_prepare

	# Replace pycryptodomex imports with pycryptodome (Gentoo uses pycryptodome)
	# pycryptodomex uses 'Cryptodome' namespace, pycryptodome uses 'Crypto'
	find . -name "*.py" -exec sed -i 's/from Cryptodome/from Crypto/g' {} + || die
	find . -name "*.py" -exec sed -i 's/import Cryptodome/import Crypto/g' {} + || die
}
