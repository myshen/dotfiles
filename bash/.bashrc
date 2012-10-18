# loaded for interactive shells
source ~/.dotfiles/bash-like-common/env;
source_file_if_exists /etc/bashrc;
source_file_if_exists ${DOTFILES}/bash-like-common/.aliases;

# COMPLETION ###################################################################
complete -A hostname ssh ping
complete -d -f mkdir rmdir chmod chown chgrp
complete -f zip
complete -e echo
complete -c -f sudo

# PROMPT ######################################################################
ESC="\[\e["
ECLR="${ESC}m\]"

HOST_C="${ESC}1;37m\]"
HOSTNAME=$(hostname);
if [[ ${HOSTNAME} == 'watershed.ucsd.edu' ]]; then
	HOST_C="${ESC}1;32m\]"
elif [[ ${HOSTNAME} == 'sui.ucsd.edu' ]]; then
	HOST_C="${ESC}1;32m\]"
elif [[ ${HOSTNAME} == 'ghdc.ucsd.edu' ]]; then
	HOST_C="${ESC}1;31m\]"
elif [[ ${HOSTNAME} == 'goship.ucsd.edu' ]]; then
	HOST_C="${ESC}1;36m\]"
elif [[ ${HOSTNAME} == 'terra.ucsd.edu' ]]; then
	HOST_C="${ESC}1;34m\]"
fi
CWD_C="${ESC}0;33m\]"
RESET_C="${ESC}0m\]"

# see asciicolors.py TERMCOLORS

prompt_div_char="~";
# Recalculated every time the prompt is shown by prompt_command
prompt_div="${prompt_div_char}";

export PS1_BASE="${HOST_C}\h${ECLR} ${CWD_C}\w${ECLR}${HOST_C} $ ${ECLR}";

function make_prompt_divider {
        header="$1 ";
        trailer=$2;
        status=$3;
        hlen=${#header};
        if [ ${hlen} -eq 1 ]; then
                hlen=0;
                header="";
        fi
        tlen=${#trailer}-1;
        # create a $prompt_div of all screen width minus the time string and a space:
        let fill_length=${COLUMNS}-${tlen}-${hlen};
        prompt_div="";
        while [ "${fill_length}" -gt "0" ]; do
            prompt_div="${prompt_div_char}${prompt_div}" # fill with underscores to work on 
            let fill_length=${fill_length}-1;
        done
        if [[ ${status} -ne 0 ]] && [[ ${status} -ne 146 ]]; then
                header="${ESC}0;31m\]${header}${HOST_C}";
                trailer="${ESC}0;31m\]${trailer}";
        fi
        prompt_div="${HOST_C}${header}${prompt_div} ${trailer}${RESET_C}\n"
}

function prompt_command {
        status=$?;
        trailer="$(date +%T)";
        header="";
        if [[ ${status} -ne 0 ]] && [[ ${status} -ne 146 ]]; then
                header=${status};
        fi
        make_prompt_divider "${header}" "${trailer}" "${status}";
        pyvenv="";
        if [ -n "${VIRTUAL_ENV}" ]; then
                pyvenv="($(basename ${VIRTUAL_ENV})) ";
        fi
        export PS1="${prompt_div}${pyvenv}${PS1_BASE}"

        # Flush current session history
        history -a;
        # Load session history
        history -n;
}
# Executed every time the prompt is shown
export PROMPT_COMMAND=prompt_command;

# ENV #########################################################################
export HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s cmdhist
unset HISTFILESIZE
export HISTSIZE=1000000
export HISTIGNORE='ls:bg:fg:history'
export HISTTIMEFORMAT='%F %T '

# Color for Man pages in less (doesn't work in zsh; untested otherwise)
export LESS_TERMCAP_mb="$'\E[01;31m'"       # begin blinking
export LESS_TERMCAP_md="$'\E[01;38;5;74m'"  # begin bold
export LESS_TERMCAP_me="$'\E[0m'"           # end mode
export LESS_TERMCAP_se="$'\E[0m'"           # end standout-mode
export LESS_TERMCAP_so="$'\E[38;5;246m'"    # begin standout-mode - info box
export LESS_TERMCAP_ue="$'\E[0m'"           # end underline
export LESS_TERMCAP_us="$'\E[04;38;5;146m'" # begin underline
