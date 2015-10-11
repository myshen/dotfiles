#!/bin/bash
DEVICE="en0";

SSID="notwifi";
PASS="71468648157149883899";

networksetup -setairportpower ${DEVICE} off && networksetup -setairportpower ${DEVICE} on;

#networksetup -setairportnetwork en0

# disconnect from wifi network
#sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport --disassociate

# scan
# /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan
#Join a wifi network from the Mac OSX terminal command line:
#networksetup -setairportnetwork ${DEVICE} ${SSID} ${PASS}

#Find your network interface name
# networksetup -listallhardwareports
