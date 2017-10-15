#!/bin/bash

# http://hints.macworld.com/article.php?story=2005010613401823

# get the ssid of the network you are on
# shown on two lines; should be one with a space
ssid="$(ioreg -l -n AirPortDriver | grep APCurrentSSID \
		| sed 's/^.*= "\(.*\)".*$/\1/; s/ /_/g')"

# fill in your own values for ssid and location below
if [ "$ssid" = "notwifi" ]; then
    location="notwifi"
else
    location="Automatic"
fi

# update the location
newloc="$(/usr/sbin/scselect ${location} | sed 's/^.*(\(.*\)).*$/\1/')"

echo "${newloc}"

[[ "${location}" != "${newloc}" ]]
