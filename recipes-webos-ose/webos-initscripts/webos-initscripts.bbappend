do_install:append() {
    INITFILE=${D}/etc/systemd/system.conf.d/webos-global.conf
    sed -i /^DefaultEnvironment=XDG_RUNTIME_DIR/d $INITFILE
    echo "DefaultEnvironment=XDG_RUNTIME_DIR=/run/user/0" >> $INITFILE
    echo "DefaultEnvironment=PULSE_SERVER=unix:/mnt/wslg/PulseServer" >> $INITFILE
    echo "DefaultEnvironment=WAYLAND_DISPLAY=wayland-1" >> $INITFILE
}