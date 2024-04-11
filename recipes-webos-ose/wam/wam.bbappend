install_units:append() {
    service=${D}${systemd_system_unitdir}/webapp-mgr.service
    sed -i /ConditionPathExists=/tmp/lsm-ready/d $service
    sed -i /After=ls-hubd.service service-manager.service/d $service
    echo "ExecStartPre=/usr/bin/test -f /tmp/lsm-ready" >> $service
    echo "RestartSec=0.5" >> $service
}