#!/usr/bin/env bash

osx_find_tmpdir() {
	# Finds the current user's TMPDIR (set by the GUI) that exists in /var/folders
	find /var/folders -type d -name "-Tmp-" -user "$(whoami)" 2>/dev/null
	# Much more elegant way to do this with zsh.
	#echo /var/folders/**/*/-Tmp-(U/)
}

osx_find_tmpdir
