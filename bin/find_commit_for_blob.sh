#!/bin/bash

obj_name="$1"
shift
git log "$@" --pretty=format:'%T %h %s' \
  | while read -r tree commit subject ; do
    if git ls-tree -r "$tree" | grep -q "$obj_name" ; then
        echo "$commit" "$subject"
    fi
done
