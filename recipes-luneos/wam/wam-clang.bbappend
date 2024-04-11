# webOS/LuneOS WebAppManager updates

install_units:append() {
    script=${D}${systemd_system_unitdir}/scripts/webapp-mgr.sh

    sed -i '1,$s/blacklist/blocklist/g' $script

    service=${D}${systemd_system_unitdir}/webapp-mgr.service

    sed -i "/^ConditionPathExists=\/tmp\/lsm-ready/d" $service
    sed -i "/^After=ls-hubd.service surface-manager.service/d" $service
    echo "ExecStartPre=/usr/bin/test -f /tmp/lsm-ready" >> $service
    echo "RestartSec=0.5" >> $service
}
