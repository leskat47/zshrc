# Aliases
alias srcrc="source ~/.zshrc"
alias dunnet='emacs -batch -l dunnet'
alias cleantilde='find . -name .snapshot -prune -o -type f -name "*~*" -print | xargs rm -f &&  find . -name .snapshot -prune -o -type f -name ".*~*" -print | xargs rm -f '
alias vi="vim"
alias more="less"

# OS Version
alias osver='echo "UNKNOWN OS: $OSTYPE"'
if [[ ${OSTYPE} == linux* ]]; then
    alias osver='lsb_release -a'
fi
if [[ ${OSTYPE} == solaris ]]; then
    alias osver='cat /etc/release'
fi
if [[ ${OSTYPE} == darwin* ]]; then
    alias osver='uname -a'
fi

# Disk Status
alias df="df -h -T"
alias dfp="df | grep %"
alias dud1="du --max-depth=1 -h"

# VNC
alias vncstart_led='vncserver -depth 24 -geometry 2560x1440'
alias vncstart_led_shared='vncserver -alwaysshared -depth 24 -geometry 2560x1440'
alias vncstart_mbp='vncserver -depth 24 -geometry 1440x900'
alias vncstart_mbp_shared='vncserver -alwaysshared -depth 24 -geometry 1440x900'
alias vnckill='vncserver -kill'

# Git Prompt
alias git_prompt_off='git config oh-my-zsh.hide-status 1'
alias git_prompt_on='git config oh-my-zsh.hide-status 0'

# Python
function profile {
    python -m cProfile "$@"
}

if [[  $(uname) == Darwin  ]]; then
    alias textwrangler="open -a TextWrangler"
    alias sublime="open -a Sublime\ Text"
fi

if [[ -d /etc/vmware-tools ]]; then
  alias vm_network_restart="sudo /etc/vmware-tools/resume-vm-default"
fi

function rgrep {
    find . | xargs grep $1
}
function rgrepf {
    find . -type f -name $1 | xargs grep $2
}
function findf {
    find . -type f -name $1
}
function chmodrf {
    find . -type f -name $1 | xargs chmod $2
}

# tar and zip directories
# NOTE: requires that directory name isn't terminated with /
function targz {
    tar -vczf $1.tgz $1
}
function tarbz2 {
    tar -vcjf $.tbz2 $1 #$1 is directory to tar/bzip2
}
function tarugz {
    tar -vxzf $1 #$1 is gzip tar name
}
function tarubz2 {
    tar -vxjf $1 #$1 is bzip2 tar name
}

# Recursive Rename
function renamer {
    find . -name "$1" -exec rename s/$1/$2/ {} \;
}
function renamertest {
    find . -name "$1" -exec rename -n s/$1/$2/ {} \;
}

# Remap the Super keys to Control keys -- emulate mac keyboard when VNC'ing to a Linux box
# Valid only if the OS is Linux
# Valid only if the OS doesn't have VMWARE installed -- where VMWARE already handles the mapping
if [[ $CURRENT_OS == 'Linux' ]]; then
    if [[ -f /usr/bin/vmware-hgfsclient ]]; then
        # Do nothing - VMWARE handles the mapping
    else
        alias supercntrl='xmodmap ~/.Xmodmap'
    fi
fi
