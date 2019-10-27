# .bash_profile

# User specific environment and startup programs
export PATH=$PATH:/Library/TeX/texbin:/usr/local/bin:~/bin:~/lib:~/.minishift/cache/oc/v1.5.1:$HOME/bin

#################################################################
# User specific aliases and functions
#################################################################

###########
# git branch for PS1
function gb() {
    if command -v git >/dev/null 2>&1; then
        echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
    fi
}
readonly -f gb
[ "$?" -eq "0" ] || return $?

function git_branch() {
    gb | sed 's/()//'
}
readonly -f git_branch
[ "$?" -eq "0" ] || return $?

###########
# less
alias less='less --RAW-CONTROL-CHARS'

###########
# rm
alias rm='rm -i'

###########
# mv
alias mv='mv -i'

###########
# ls
export LS_OPTS='-Flh'

#if color is available use it
#OS X does not support --color=auto
ls --color=al > /dev/null 2>&1 && alias ls='ls ${LS_OPTS} --color=auto' || alias ls='ls ${LS_OPTS}'

alias l='ls'
alias ll='ls'
alias lll='ls'
alias lla='ls -a'

###########
# grep
# if color is available use it
# macOS does not support --color=auto
export GREP_OPTS=' -in' 
export GREP_COLOR='1;32'

grep --color=auto > /dev/null 2>&1 && alias grep='grep ${GREP_OPTS} --color=auto' || alias grep='grep ${GREP_OPTS}'

###########
# text editor
alias bashrc='vim ~/.bashrc'

#################################################################
# Colors
#################################################################

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

#################################################################
# Shelloptions
#################################################################

shopt -s autocd > /dev/null 2>&1

#################################################################
# Terminal
#################################################################

export CLICOLOR=1

UC=$COLOR_LIGHT_GREEN               # user's color
[ $UID -eq "0" ] && UC=$COLOR_RED   # root's color

PS1="\n\[${COLOR_LIGHT_GRAY}\]\t \[${UC}\]\u \[${COLOR_LIGHT_CYAN}\]\h \[${COLOR_YELLOW}\]\${PWD} \[${COLOR_RED}\]\$(git_branch) \n\[${COLOR_LIGHT_GREEN}\]→\[${COLOR_NC}\] "