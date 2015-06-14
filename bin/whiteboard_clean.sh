#!/bin/bash

# Cleans an image of a whiteboard for better legibility.
# http://www.reddit.com/r/commandline/comments/1weqnn/cli_oneliner_script_to_clean_up_and_beautify/

convert "$1" \
        -resize %50 -\
        morphology Convolve DoG:15,100,0 \
        -negate \
        -normalize \
        -blur 0x1 \
        -channel RBG \
        -level 60%,91%,0.1 \
        "$2"
