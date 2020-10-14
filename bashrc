# .bash_profile

# User specific environment and startup programs
# export PATH=$PATH:/usr/local/bin:~/bin:~/lib:$HOME/bin

#################################################################
# User specific aliases and functions
#################################################################

# long bash history
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

# add timestamp to history
export HISTTIMEFORMAT="%F %T "

# append history from multiple sessions
# https://askubuntu.com/questions/80371/bash-history-handling-with-multiple-terminals
export PROMPT_COMMAND='history -a'

# docker cleanup
function dclean() {
    echo "+ docker rm $(docker ps -aq --filter 'status=exited')" && docker rm $(docker ps -aq --filter 'status=exited') 2&>/dev/null
    echo "+ docker image rm -f $(docker image ls -q)" && docker image rm -f $(docker image ls -q) 2&>/dev/null
}
readonly -f dclean
[ "$?" -eq "0" ] || return $?

# docker interactive and cleanup
function di() {
    echo "+ docker run --rm -it $@" && docker run --rm -it $@
}
readonly -f di
[ "$?" -eq "0" ] || return $?

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

###########
# text editor
alias bashrc='vim ~/.bashrc'

###########
# kubectl
alias k='kubectl'

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