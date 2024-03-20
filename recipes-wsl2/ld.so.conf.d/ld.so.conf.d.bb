DESCRIPTION = "Install a ld.so.conf.d directory"
LICENSE = "MIT"

# Add missing ld.so.conf.d directory referenced in glibc package ld.so.conf, but
# never created. WSL2 expects this to exist, so it can override libraries where necessary.

do_install:append() {
    install -d ${D}${sysconfdir}/ld.so.conf.d
}

FILES:${PN}:append = " ${sysconfdir}/"
