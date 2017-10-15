#!/bin/bash

# https://gist.github.com/Frick/1e0d77121cee39bad831
openfiles() {
    if [ "${1}" = "-h" ]; then
        echo -e "Usage: openfiles [r|w|m|R|W] regex\n    -r    opened for reading or read/write\n    -w    opened for writing or read/write\n    -m    accessed from memory (includes running command)\n    -R    opened for reading only\n    -W    opened for writing only"
        return
    fi
    if [ "$#" = "0" ]; then
        echo "Process signature/regex required."
        return
    fi
    MODE="(w|u)"
    ACTION="for writing"
    if [ "${1}" = "r" ]; then
        MODE="(r|u)"
        ACTION="for reading"
        shift
    elif [ "${1}" = "R" ]; then
        MODE="r"
        ACTION="for reading (only)"
        shift
    elif [ "${1}" = "W" ]; then
        MODE="w"
        ACTION="for writing (only)"
        shift
    elif [ "${1}" = "m" ]; then
        MODE="(txt|mem)"
        ACTION="in memory"
        shift
    elif [ "${1}" = "w" ]; then
        shift
    fi
    if [ "${MODE}" != "(txt|mem)" ]; then
        MODE="[0-9]+${MODE}"
    fi
    PIDS=$(pgrep -d "," -f "${@}")
    if [ "${PIDS}" = "" ]; then
        echo "No processes found matching '${@}'."
        return
    fi
    OPENFILES=$(sudo lsof -PXn -p ${PIDS} | egrep "${MODE}[A-Za-z]* +REG" | awk '{print $9}' | egrep -v "^\[" | sort | uniq);
    if [ "${OPENFILES}" = "" ]; then
        echo "No files opened ${ACTION}."
    else
        echo "Files opened ${ACTION}:"
        sudo ls -ahl $OPENFILES
    fi
}
