# webOS/LuneOS WebAppManager updates

install_units:append() {
    script=${D}${systemd_system_unitdir}/scripts/webapp-mgr.sh

    sed -i '1,$s/blacklist/blocklist/g' $script
}
