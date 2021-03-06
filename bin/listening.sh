#!/usr/bin/env bash

# https://gist.github.com/Frick/0c22207f0445477a66e9
function listening {
    if [ "${1}" = "-h" ]; then
        echo "Usage: listening [t|tcp|u|udp] [ps regex]"
        return
    fi
    DISP="both"
    NSOPTS="tu"
    if [ "${1}" = "t" -o "${1}" = "tcp" ]; then
        DISP="tcp"
        NSOPTS="t"
        shift
    elif [ "${1}" = "u" -o "${1}" = "udp" ]; then
        DISP="udp"
        NSOPTS="u"
        shift
    fi
    FILTER="${@}"
    PORTS_PIDS=$(sudo netstat -"${NSOPTS}"lnp | tail -n +3 | tr -s ' ' | sed -n 's/\(tcp\|udp\) [0-9]* [0-9]* \(::\|0\.0\.0\.0\|127\.[0-9]*\.[0-9]*\.[0-9]*\):\([0-9]*\) .* \(-\|\([0-9-]*\)\/.*\)/\3 \1 \5 \2/p' | sed 's/\(::\|0\.0\.0\.0\)/EXTERNAL/' | sed 's/127\.[0-9]*\.[0-9]*\.[0-9]*/LOCALHOST/' | sort -n | tr ' ' ':' | sed 's/::/:-:/' | sed 's/:$//' | uniq)
    PS=$(sudo ps -e --format '%p %a')
    echo -e '   Port - Protocol - Interface - Program\n-----------------------------------------------'
    for PORT_PID in ${PORTS_PIDS}; do
        PORT=$(echo ${PORT_PID} | cut -d':' -f1)
        PROTOCOL=$(echo ${PORT_PID} | cut -d':' -f2)
        PID=$(echo ${PORT_PID} | cut -d':' -f3)
        INTERFACE=$(echo ${PORT_PID} | cut -d':' -f4)
        if [ "${PROTOCOL}" != "${DISP}" -a "${DISP}" != "both" ]; then
            continue
        fi
        if [ "${PID}" = "-" ]; then
            if [ "${FILTER}" != "" ]; then
                continue
            fi
            printf "%7s - %8s - %9s - -\n" "${PORT}" "${PROTOCOL}" "${INTERFACE}"
        else
            PROG=$(echo "${PS}" | grep "^ *${PID}" | grep -o '[0-9] .*' | cut -d' ' -f2-)
            if [ "${FILTER}" != "" ]; then
                echo "${PROG}" | grep -q "${FILTER}"
                if [ $? -ne 0 ]; then
                    continue
                fi
            fi
            printf "%7s - %8s - %9s - %s\n" "${PORT}" "${PROTOCOL}" "${INTERFACE}" "${PROG}"
        fi
    done
}

if [ "$0" = "$BASH_SOURCE" ]; then
    listening "$@"
fi
