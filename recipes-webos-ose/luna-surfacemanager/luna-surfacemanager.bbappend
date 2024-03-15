do_install:append() {
    # TODO: probably should invent a better way to handle setting these variables, in conjunction with meta-webos and meta-luneos
    sed -i /^WEBOS_COMPOSITOR_DISPLAY_CONFIG=/d ${D}/etc/surface-manager.d/product.env
    echo "export WAYLAND_DISPLAY_LSM=wayland-1" >> ${D}/etc/surface-manager.d/product.env
    echo "export WEBOS_COMPOSITOR_PLATFORM=wayland" >> ${D}/etc/surface-manager.d/product.env
    echo "export WAYLAND_DISPLAY=wayland-0" >> ${D}/etc/surface-manager.d/product.env
    echo "export XDG_RUNTIME_DIR=/run/user/0" >> ${D}/etc/surface-manager.d/product.env
    echo "export PULSE_SERVER=unix:/mnt/wslg/PulseServer" >> ${D}/etc/surface-manager.d/product.env
}