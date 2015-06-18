# Aliases
alias srcrc="source ~/.zshrc"
alias dunnet='emacs -batch -l dunnet'
alias cleantilde='find . -name .snapshot -prune -o -type f -name "*~*" -print | xargs rm -f &&  find . -name .snapshot -prune -o -type f -name ".*~*" -print | xargs rm -f '

alias vncstart_led='vncserver -depth 24 -geometry 2560x1440'
alias vncstart_led_shared='vncserver -alwaysshared -depth 24 -geometry 2560x1440'
alias vncstart_mbp='vncserver -depth 24 -geometry 1440x900'
alias vncstart_mbp_shared='vncserver -alwaysshared -depth 24 -geometry 1440x900'
alias vnckill='vncserver -kill'


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

# Install Libs that we want that don't come on a fresh install
function install_libs {
    # Needed for supervisord
    sudo yum install python-devel
    
    # Required for Cadence
    sudo yum install /lib/ld-linux.so.2
    sudo yum install glibc-devel.i686
    sudo yum install libX11.so.6
    sudo yum install libXext.so.6
    
    # Required for lmgrd
    sudo yum install /lib/ld-lsb.so.3
    sudo yum install /lib64/ld-lsb-x86-64.so.3

    # Required for Altera Quartus
    sudo yum install libpng12.so.0
    sudo yum install libfreetype.so.6
    sudo yum install libSM.so.6
    sudo yum install libfontconfig.so.1

    # Extra Packages for Enterprise Linux Repo - useful for getting the latest tools on the dated RHEL/CentOS installs
    sudo yum install epel-release
}


# Remap the Super keys to Control keys -- emulate mac keyboard when VNC'ing to a Linux box
# Valid only if the OS is Linux
# Valid only if the OS doesn't have VMWARE installed -- where VMWARE already handles the mapping
if [[ $CURRENT_OS == 'Linux' ]]; then
    if [[ -f /usr/bin/vmware-hgfsclient ]]; then
        # Do nothing - VMWARE handles the mapping
    else
        function supercntrl {
            perl -e '
                my @modmap = `xmodmap`;
                # Iterate the modmap - look for existing Super_ and remove them
                foreach (@modmap) {
                  if (/Super/) {
                    #print $_;
                    /^(\w+)\s+/;
                    my $syscall_l = "xmodmap -e \"remove ".$1." = Super_L\"\n";
                    my $syscall_r = "xmodmap -e \"remove ".$1." = Super_R\"\n";
                    #print $syscall_l;
                    #print $syscall_r;
                    system($syscall_l);
                    system($syscall_r);
                  }
                }
                # Add the Super Keys back to control
                my $syscall_l = "xmodmap -e \"add control = Super_L\"\n";
                my $syscall_r = "xmodmap -e \"add control = Super_R\"\n";
                system($syscall_l);
                system($syscall_r);
            '
        }
    fi
fi



