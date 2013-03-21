# loaded for interactive shells
source "${HOME}/.dotfiles/bash-like-common/.aliases";

function autoload_init {
        autoload -U $1 && $1;
}
autoload_init promptinit;
# Run compinit without checking for insecure directories
autoload -U compinit; compinit -u;
autoload_init colors;

setopt interactivecomments;
setopt noclobber;
# Ignore trailing '`' if not paired
setopt sunkeyboardhack;
#set -o emacs;

# PROMPT ######################################################################
setopt prompt_subst
function precmd {
        PROMPT_LAST_CMD=" | $(history -1 | sed 's/^[ \t]*//' | sed 's/%/%%/')";
        local termwidth;
        (( termwidth = ${COLUMNS} - 1 ));
        if [[ $(jobs | wc -l) -gt 0 ]]; then
                PROMPT_JOBS=" | jobs: %j";
        else
                PROMPT_JOBS="";
        fi

        PROMPT_COLOR_CWD_SEP="%{$fg[black]%}";
        PROMPT_COLOR_CWD_PART="%{$fg[yellow]%}";
        PROMPT_CWD="${${(%):-%d}//\//${PROMPT_COLOR_CWD_SEP}%B/%b${PROMPT_COLOR_CWD_PART}}%f";
}

function initprompt_ {
        PROMPT_COLOR="%{$fg[blue]%}";
        PROMPT_COLOR_HOST="%{$fg[green]%}";
        local hostname_=$(hostname);
        if [[ ${hostname_} == 'sui.ucsd.edu' ]]; then
                PROMPT_COLOR_HOST="%{$fg[blue]%}"
        elif [[ ${hostname_} == 'ghdc.ucsd.edu' ]]; then
                PROMPT_COLOR_HOST="%{$fg[red]%}"
        elif [[ ${hostname_} == 'goship.ucsd.edu' ]]; then
                PROMPT_COLOR_HOST="%{$fg[yellow]%}"
                PROMPT_COLOR="%{$fg[green]%}"
        elif [[ ${hostname_} == 'terra.ucsd.edu' ]]; then
                PROMPT_COLOR_HOST="%{$fg[cyan]%}"
        fi

        PROMPT='${PROMPT_COLOR}\
. %n%{$fg[black]%}@${PROMPT_COLOR_HOST}%M${PROMPT_COLOR}%{$fg[black]%}:${PROMPT_CWD} ${PROMPT_COLOR}%l 
  %(?.%{$fg[green]%}.%{$fg[red]%})%?${PROMPT_COLOR}${PROMPT_JOBS}%{${PROMPT_LAST_CMD}%}
  %h ${PROMPT_COLOR_HOST}%# \
%{$reset_color%}';

        RPROMPT="${PROMPT_COLOR}$(date +%F) %*%{$reset_color%}";
}
initprompt_;

# HISTORY #####################################################################
HISTSIZE=1000;
SAVEHIST=10000;
HISTFILE=~/.zhistory;
setopt BANG_HIST;
# Don't like. Can't keep history separate between terminals.
#setopt SHARE_HISTORY;
setopt INC_APPEND_HISTORY;
setopt HIST_IGNORE_SPACE;
setopt HIST_IGNORE_ALL_DUPS;
setopt EXTENDED_HISTORY;
setopt HIST_NO_STORE;
bindkey "^r" history-incremental-search-backward

function history_share {
        fc -RI;
}
