# TODO: this is currently identical to luna-surfacemanager.bbappend::do_install:append
# how can we reuse this....

do_install:append() {
    # TODO: probably should invent a better way to handle setting these variables, in conjunction with meta-webos and meta-luneos

    # remove display searching from surface-manager startup, as WSL does not support DRM devices
    sed -i /^WEBOS_COMPOSITOR_DISPLAY_CONFIG=/d ${D}/etc/surface-manager.d/product.env
    # setup LSM to run with display name wayland-1 for webOS/LuneOS apps to use
    echo "export WAYLAND_DISPLAY_LSM=wayland-1" >> ${D}/etc/surface-manager.d/product.env
    # setup LSM to output using wayland, so WSLg can display it
    echo "export WEBOS_COMPOSITOR_PLATFORM=wayland-egl" >> ${D}/etc/surface-manager.d/product.env
    # setup LSM to output to WSLg's wayland-0 display
    echo "export WAYLAND_DISPLAY=wayland-0" >> ${D}/etc/surface-manager.d/product.env
    # setup xdg runtime socket directory to WSLg's
    sed -i '1a export XDG_RUNTIME_DIR=/run/user/0' ${D}/etc/surface-manager.d/product.env
    # setup pulse audio for LSM to output to WSL
    echo "export PULSE_SERVER=unix:/mnt/wslg/PulseServer" >> ${D}/etc/surface-manager.d/product.env
    # clear QT_WAYLAND_SHELL_INTEGRATION as without it, we get no window at all for lsm
    echo "export QT_WAYLAND_SHELL_INTEGRATION=" >> ${D}/etc/surface-manager.d/product.env
    # clear QT_WAYLAND_DISABLE_WINDOWDECORATION, so we get a window frame
    echo "export QT_WAYLAND_DISABLE_WINDOWDECORATION=" >> ${D}/etc/surface-manager.d/product.env
    # eliminate the default XDG_RUNTIME_DIR and link the WSL runtime dir to where it used to be, to catch any apps that might not get XDG updated
    echo "rm -rf /tmp/luna-session" >> ${D}/etc/surface-manager.d/product.env
    echo "ln -sf /run/user/0 /tmp/luna-session" >> ${D}/etc/surface-manager.d/product.env
}
