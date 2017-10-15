#!/bin/bash

# domain="$1"
# wget \
#      -e robots=off \
#      --backup-converted \
#      --backups=0 \
#      --page-requisites \
#      --html-extension \
#      --convert-links \
#      --domains "${domain}" \
#      --no-parent \
#      "${domain}" \
#      ;

wget \
     -e robots=off \
     -r \
     --no-parent \
     -l 2 \
     --page-requisites \
     --adjust-extension \
     --convert-links \
		 "$@" \
     ;
