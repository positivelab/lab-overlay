# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils pax-utils xdg

MY_PN="${PN/-bin/}"

DESCRIPTION="Postman is an API platform for building and using APIs"
HOMEPAGE="https://www.postman.com"
SRC_URI="
	amd64? ( https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}-amd64.tar.gz )
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN^}/app"

src_prepare() {
	mv _Postman Postman
	default
}

src_install() {
	local dir="/opt/${PN}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/Postman
	fperms 755 "${dir}"/postman

	make_wrapper "${PN}" "${dir}/Postman"
	newicon "resources/app/assets/icon.png" "${PN}.png"
	make_desktop_entry "${PN}" "Postman" "${PN}" "Development;IDE;"
}
