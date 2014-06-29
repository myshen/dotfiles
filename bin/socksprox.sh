#!/bin/bash
wifi_netserv=$(networksetup -listallnetworkservices | grep -i wi);
socks_port=1080;

ssh_proxy_user="$1";
ssh_proxy_host="$2";
ssh_proxy_socket="~/tmp/socks_${ssh_proxy_user}_${ssh_proxy_host}.socket";

turnon=0;

if [ ${turnon} -eq 1 ]; then
        echo "starting proxy SOCKS for ${wifi_netserv}";
        echo "you may be asked for your ssh password";
        ssh -f -N -S ${ssh_proxy_socket} -D ${socks_port} \
                ${ssh_proxy_user}@${ssh_proxy_host};
        if [ $? -eq 0 ]; then
          sudo networksetup -setsocksfirewallproxy ${wifi_netserv} localhost ${socks_port};
        fi
        #networksetup -setsocksfirewallproxystate ${wifi_netserv} on;
        export HTTP_PROXY="localhost:${socks_port}";

        networksetup -getsocksfirewallproxy ${wifi_netserv};
else
        echo "shutting down SOCKS proxy for ${wifi_netserv}";
        ssh -S ${ssh_proxy_socket} -O exit localhost;
        sudo networksetup -setsocksfirewallproxystate ${wifi_netserv} off;
        unset HTTP_PROXY;
fi
