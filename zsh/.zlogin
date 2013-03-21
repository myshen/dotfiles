if [[ "${SSH_CONNECTION}" != "" ]]; then
        sync_osx_tmpdir;

        client_b_block=$(echo ${SSH_CONNECTION} | awk '{print $1}' | tr '.' ' ' | awk '{print $1 "." $2}');
        host_b_block=$(echo ${SSH_CONNECTION} | awk '{print $3}' | tr '.' ' ' | awk '{print $1 "." $2}');

        if [[ "${client_b_block}" != "${host_b_block}" ]]; then
                attachOrNewTmux;
        fi
else
        attachOrNewTmux;
fi
