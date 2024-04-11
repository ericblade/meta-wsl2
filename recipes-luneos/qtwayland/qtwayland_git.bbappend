# luneOS deletes a bunch of platform libs that seem to be necessary to function in WSL

do_install:append:class-target() {
    install -d ${D}${QT6_INSTALL_PLUGINSDIR}
    cp -r ${B}/lib/plugins/* ${D}${QT6_INSTALL_PLUGINSDIR}
}