SUMMARY = "Microsoft DirectX Headers (to allow mesa to use D3D12)"
HOMEPAGE = "https://github.com/microsoft/DirectX-Headers"
# i would disagree with this section, but that's where mesa says it is, so let's go with it
SECTION = "x11"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=aaa4b40c8c7acbdb03cf0e9103fb0bb1"

SRC_URI = "git://github.com/microsoft/DirectX-Headers.git;branch=main;protocol=https \
           "
SRCREV = "5c45253f7d5dd2f967f45f3f48088890d72640a5"

S = "${WORKDIR}/git"

EXTRA_OEMESON = " \
    -Dbuild-test=false \
"

inherit meson pkgconfig
