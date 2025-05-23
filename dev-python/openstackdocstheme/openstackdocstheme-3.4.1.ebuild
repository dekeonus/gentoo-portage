# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Theme and extension support for Sphinx documentation"
HOMEPAGE="
	https://docs.openstack.org/openstackdocstheme/latest/
	https://opendev.org/openstack/openstackdocstheme/
	https://github.com/openstack/openstackdocstheme/
	https://pypi.org/project/openstackdocstheme/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~ppc64 ~riscv ~s390 x86"

BDEPEND="
	>dev-python/pbr-2.1.0[${PYTHON_USEDEP}]
"
RDEPEND="
	${BDEPEND}
	>=dev-python/dulwich-0.15.0[${PYTHON_USEDEP}]
"
