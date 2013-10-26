#!/bin/sh

#######################
# OS X volume control #
# author: myshen      #
# created: 2012-08-01 #
#######################

showHelp () {
    echo "Usage: `basename $0` <option>";
    echo;
    echo "Options:";
    echo " status   = Shows current volume and mute status.";
    echo " get      = Shows current volume.";
    echo " up       = Turn volume up a bit.";
    echo " do(wn)   = Turn volume down a bit.";
    echo " set      = Set volume to percentage.";
    echo " mute     = Mute volume.";
    echo " unmute   = Unmute volume.";
}

if [ $# = 0 ]; then
    showHelp;
fi

while [ $# -gt 0 ]; do
    arg=$1;
    case $arg in
        "get")
            osascript -e "output volume of (get volume settings)";
            break ;;

        "status")
            osascript -e "output volume of (get volume settings)";
            osascript -e "output muted of (get volume settings)";
            break ;;

        "up")
            echo "Volume up.";
            osascript -e "set volume output volume 6";
            break ;;

        "do"|"down")
            echo "Volume down.";
            osascript -e "set volume output volume 2";
            break ;;

        "set")
            echo "Setting volume to $2";
            osascript -e "set volume output volume $2";
            break ;;

        "mute")
            echo "Muting.";
            osascript -e "set volume output muted true";
            break ;;

        "unmute")
            echo "Unmuting.";
            osascript -e "set volume output muted false";
            break ;;

        "help" | * )
            showHelp;
            break ;;
    esac
done

