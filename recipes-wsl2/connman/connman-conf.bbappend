do_install:append() {
    echo "[global]
Name=WSL Network
Description=WSL Network

[service_ethernet]
Type=ethernet
IPv4=172.29.242.41/255.255.0.0/172.29.240.1
Nameservers=172.29.240.1
" >> ${D}/var/lib/connman/wslnetwork.config
}