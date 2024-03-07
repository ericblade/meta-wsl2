DESCRIPTION = "Install a wsl.conf configuration to set default username and use of systemd"
LICENSE = "MIT"

# Install WSL.conf
WSL_DEFAULT_USERNAME ??= "root"

WSLCONF_FILE = "${D}${sysconfdir}/wsl.conf"

do_install() {
    install -d ${D}${sysconfdir}
    # if using systemd, tell wsl that it needs to invoke systemd at start
    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        echo "[boot]\nsystemd=true\n\n" >> ${WSLCONF_FILE}
    fi
    echo "[user]\ndefault=$WSL_DEFAULT_USERNAME\n" >> ${WSLCONF_FILE}
}