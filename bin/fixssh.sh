#!/bin/bash

# Fix SSH cached host keys
# https://gist.github.com/Frick/9bdf130d3021dcfbbfa5
fixssh() {
    local hostname=""
    local ip=""
    for arg in "$@"; do
        local hostout
        hostout="$(host "$arg" 2>/dev/null)"
        if [ $? -eq 0 ]; then
            local out
            out="$(echo "$hostout" | grep -o "has address .*$" | grep -Eo "[0-9.]{7,15}")"
            if [ $? -eq 0 ]; then
                local hostname="$arg"
                local ip="$out"
            else
                out="$(echo "$hostout" | grep -o "domain name pointer .*\." | cut -d' ' -f4)"
                if [ "$out" != "" ]; then
                    local hostname="${out:0:-1}"
                    local ip="$arg"
                fi
            fi
            break
        fi
    done
    if [ "$ip" != "" ]; then
        ssh-keygen -f ~/.ssh/known_hosts -R "$ip"
        ssh-keyscan -H "$ip" 2>/dev/null >> ~/.ssh/known_hosts
    fi
    if [ "$hostname" != "" ]; then
        ssh-keygen -f ~/.ssh/known_hosts -R "$hostname"
        ssh-keyscan -H "$hostname" 2>/dev/null >> ~/.ssh/known_hosts
    fi
    ssh "$@"
}
