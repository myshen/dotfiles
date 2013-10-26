#!/bin/bash

domain=$1;

wget --recursive \
     --page-requisites \
     --html-extension \
     --convert-links \
     --domains ${domain} \
     --continue \
     --no-parent ${domain};