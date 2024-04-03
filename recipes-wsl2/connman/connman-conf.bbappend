# TODO: may need to figure out how to do this for other distros, as the main.conf is provided by luneos's recipe

do_install:append:luneos() {
    sed -i "s/NetworkInterfaceBlacklist = usb/NetworkInterfaceBlacklist=eth,lo,usb/" ${D}${sysconfdir}/connman/main.conf
}

