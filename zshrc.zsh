#
# .zshrc file
# ln -s this file to ~/.zshrc
#

#zmodload zsh/zprof

# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim
export SVN_EDITOR=vim

# This fixes using SSH in urxvt
if [[ $TERM == 'rxvt-unicode' ]] ; then
    export TERM='xterm'
fi

# Ensure path is unique
typeset -U path

# Prevent Runaway Jobs from taking down the machine
# Limit to 90% of the max physical memory
if [[ -e /proc/meminfo ]] ; then
    MAX_MEM=`awk '/MemTotal/ {print $2}' /proc/meminfo`
    let PERCENT_LIMIT=0.9
    MAX_MEM_LIMIT=$(($MAX_MEM*$PERCENT_LIMIT))
    MAX_MEM_LIMIT_INT=${MAX_MEM_LIMIT%%.*}
    ulimit -Sv $MAX_MEM_LIMIT_INT
fi

#
# OS Detection
#

UNAME=`uname`
UNAME_KERNEL_VERSION=`uname -v`

# Fallback info
CURRENT_OS='Linux'
DISTRO='NA'
DISTRO_REL='current'

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
    DISTRO_REL='current'
elif [[ $UNAME == 'Linux' ]]; then

    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi

        # Still have some old RHEL distros around -- mark 6,7 as current
        if grep -q "release 7" /etc/redhat-release; then
            DISTRO_REL='current'
        elif grep -q "release 6" /etc/redhat-release; then
            DISTRO_REL='current'
        else
            DISTRO_REL='old'
        fi
    elif [[ $UNAME_KERNEL_VERSION == *rodete* ]]; then
        DISTRO='Rodete'
	DISTRO_REL='current'
    else
        # Assume Ubuntu if it's not RHEL
        DISTRO='Ubuntu'
        DISTRO_REL='current'

        if  [[ $UNAME_KERNEL_VERSION == *"Microsoft"* ]]; then
            DISTRO='UbuntuMicrosoft'
        fi

    fi
else
    DISTRO='Unknown'
    DISTRO_REL='current'
fi

# Setup VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs

# Source zinit Modules
source ~/zshrc/zinit.zsh

# Source Alias File
if [[ -e ~/zshrc/alias.zsh ]]; then
    source ~/zshrc/alias.zsh
fi

# Source Work Tools File
if [[ -e ~/zshrc_work/worktools.zsh ]]; then
    alias srcwrk='source ~/zshrc_work/worktools.zsh'
fi

# Source "Me" File
if [[ -e ~/zshrc_me/me.zsh ]]; then
    source ~/zshrc_me/me.zsh
    alias srcme='source ~/zshrc_me/me.zsh'
fi

#zprof
