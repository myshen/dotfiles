#!/bin/bash
DEVICE="en0";
networksetup -setairportpower ${DEVICE} off && networksetup -setairportpower ${DEVICE} on;
