#!/bin/bash
NAME='.cd_wd_cache'
PWDFILE="${HOME}/${NAME}";
pwd > ${PWDFILE};
open -a Terminal.app $(which bash)
