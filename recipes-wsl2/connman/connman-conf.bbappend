# TODO: This does NOT work for everyone!  Apparently networking configuration in WSL can be quite complex, and so we need to
# either find a way to disable connman's functionality without destroying it completely, as many other pieces of systems may depend upon it,
# or configure the network more intelligently than just jamming it with an IP.

do_install:append() {
    install -d ${D}/var/lib/connman
    echo "[global]
Name=WSL Network
Description=WSL Network

[service_ethernet]
Type=ethernet
IPv4=172.29.242.41/255.255.0.0/172.29.240.1
Nameservers=172.29.240.1
" >> ${D}/var/lib/connman/wslnetwork.config
}

FILES:${PN}:append = " /var/lib/connman/wslnetwork.config"

