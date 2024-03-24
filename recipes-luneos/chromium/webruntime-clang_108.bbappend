modify_run_app_shell:append:luneos() {
    script=${D}${APP_SHELL_RUNTIME_RUN_SCRIPT}
    sed -i '1a export XDG_RUNTIME_DIR=/run/user/0' $script
    sed -i '1a export WAYLAND_DISPLAY=wayland-1' $script
    sed -i '1a export PULSE_SERVER=unix:/mnt/wslg/PulseServer' $script
    sed -i '/export XDG_RUNTIME_DIR=\/tmp\/luna-session/d' $script
}