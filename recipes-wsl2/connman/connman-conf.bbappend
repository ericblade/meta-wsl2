# TODO: delete the line from the config, then adding it should work universally, rather than seding or patching it in luneos and adding it elsewhere

do_install:append:luneos() {
    sed -i "s/NetworkInterfaceBlacklist = usb/NetworkInterfaceBlacklist=eth,lo,usb/" ${D}${sysconfdir}/connman/main.conf
}

do_install:append:webos() {
    echo "NetworkInterfaceBlacklist=eth,lo,usb" >> ${D}${sysconfdir}/connman/main.conf
}
