# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( pypy3 pypy3_11 python3_{10..13} )

inherit distutils-r1

DESCRIPTION="URL normalization for Python"
HOMEPAGE="
	https://github.com/niksite/url-normalize/
	https://pypi.org/project/url-normalize/
"
SRC_URI="
	https://github.com/niksite/url-normalize/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ppc64 ~riscv x86"

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	# remove problematic pytest options
	rm tox.ini || die
	sed -e '/requires/s:poetry:&-core:' \
		-e '/backend/s:poetry:&.core:' \
		-i pyproject.toml || die
	distutils-r1_src_prepare
}
