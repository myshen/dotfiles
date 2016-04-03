source ~/.dotfiles/bash-like-common/upstart.sh

vpn() { svc openvpn $@ ;}
vpns() { vpn status | grep "is running" | sed "s/.* VPN '\(.*\)'.*/\1/" ;}

vpn_start() {
    local vpnname="$1"; shift
    local testhost="$1"; shift
	vpn start "$vpnname" 1>&2
	vpn status "$vpnname" 1>&2 && \
	    "ping-until" "$testhost" || \
	    (echo ":("; sudo grep -A 20 "\[OpenVPN Server\] Peer Connection Initiated" /var/log/syslog | tail -n 20)
}

vpn_wrap() {
    local vpnname="$1"; shift
    local testhost="$1"; shift

    vpn_start "$vpnname" "$testhost" && \
        $@
    vpn stop "$vpnname" 1>&2
}
