
SRC_URI = "git://www.github.com/ericblade/sam.git;branch=getAppLaunchEnvironment"
SRC_URI:append = "\
    file://0001-com.webos.sam.role.json.in-Fix-various-outbound-perm.patch \
    file://0002-Allow-getAppBasePath-also-from-trusted-apps.patch \
    file://0003-RunningApp-disable-killer-timeout-for-app-relaunch.patch \
    file://0004-Setup-QML-style-for-LuneOS.patch \
    file://0005-Handle-noWindow-apps.patch \
    file://0006-AppDescription.h-Add-org.webosports-as-privileged-as.patch \
    file://0007-Setup-QT_IM_MODULE-for-client-apps.patch \
    file://0008-NativeContainer-configure-native-apps.patch \
    file://0009-Setup-QT_WAYLAND_SHELL_INTEGRATION-for-webOS.patch \
"

SRCREV = "c58b7a502390c96ac55b443b272799cfc4e2d6fd"

do_compile:prepend() {
    # TODO: i think this can be removed now?
    sed -i '/runningApp->getLinuxProcess().addEnv("XDG_RUNTIME_DIR", "\/tmp\/luna-session");/d' ${S}/src/bus/client/NativeContainer.cpp
}