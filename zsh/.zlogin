if [[ "${SSH_CONNECTION}" != "" ]]; then
        sync_osx_tmpdir;
        attachOrNewTmux;
fi
