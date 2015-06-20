#
# setup ssh-agent
#

# http://mah.everybody.org/docs/ssh#run-ssh-agent

# set environment variables if user's agent already exists
#SSH_AUTH_SOCK=$('ls' -l /tmp/ssh-*/agent.* 2> /dev/null | grep $(whoami) | awk '{print $9}')
SSH_AUTH_SOCK=$(/bin/find /tmp/ssh-* -user "$(id -u)" -name 'agent.*' 2> /dev/null | head -n 1)
SSH_AGENT_PID=$(echo $SSH_AUTH_SOCK | cut -d. -f2)
[ -n "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK
[ -n "$SSH_AGENT_PID" ] && export SSH_AGENT_PID

if [ ! -S $SSH_AUTH_SOCK ]; then
  unset SSH_AGENT_PID
fi

start_ssh_agent() {
  eval `ssh-agent -s` > /dev/null
}

# start agent if necessary
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
        start_ssh_agent
fi

# setup addition of keys when needed
if [ -z "$SSH_TTY" ] ; then                     # if not using ssh
  ssh-add -l > /dev/null                        # check for keys
  if [ 2 -eq $? ] ; then
    'rm' "$SSH_AUTH_SOCK"
    'rmdir' "$(dirname $SSH_AUTH_SOCK)"
    start_ssh_agent
  fi
  if [ 0 -eq $? ]; then
    alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh ; ssh'
    if [ -f "/usr/lib/ssh/x11-ssh-askpass" ] ; then
      SSH_ASKPASS="/usr/lib/ssh/x11-ssh-askpass" ; export SSH_ASKPASS
    fi
  fi
fi
