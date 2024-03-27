SRC_URI = "git://www.github.com/ericblade/luna-surfacemanager.git;branch=getAppLaunchEnvironment"

SRC_URI:append:luneos = "\
    file://0001-Add-capability-to-pass-extra-options-to-surface-mana.patch \
    file://0002-WebOSShellSurface-add-setClientSize.patch \
    file://0003-webosscreenshot-respect-QT_OPENGL_ES.patch \
    file://0004-DefaultSettings.qml-Use-Prelude-for-LuneOS.patch \
    file://0005-Update-com.webos.surfacemanager.role.json.in.patch \
    file://0006-product.env.in-Make-it-work-with-non-drm-devices.patch \
    file://0007-Add-additional-permissions-for-org.webosports.notifi.patch \
    file://0008-base.pro-Remove-building-of-tests.patch \
    file://0009-com.webos.surfacemanager.perm.json-Add-permissions-f.patch \
    file://0010-qmldir-expose-NotificationService-component.patch \
    file://0011-Input-panel-tie-inputPanelRect-to-the-window-mask.patch \
    file://0012-WebOSSurfaceItem-close-Wayland-client-fallback-on-Cl.patch \
"
SRCREV = "aceeec568ae4facf7a6bc0d80868851c35bb044c"

do_install:append:luneos() {
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
    # eliminate the default XDG_RUNTIME_DIR and link the WSL runtime dir to where it used to be, to catch any apps that might not get XDG updated
    echo "rm -rf /tmp/luna-session" >> ${D}/etc/surface-manager.d/product.env
    echo "ln -sf /run/user/0 /tmp/luna-session" >> ${D}/etc/surface-manager.d/product.env
}

install_units:append:luneos() {
    #TODO: there's probably a variable that holds /usr/lib/systemd?
    scriptPath="/usr/lib/systemd/system/surface-manager.service"
    script=${D}${scriptPath}

    sed -i '/ExecStartPre=\/bin\/mkdir -p \/tmp\/luna-session/d' $script
    sed -i '/ExecStartPre=-\/bin\/ln -s \/tmp\/luna-session \/var\/run\/xdg/d' $script
}
