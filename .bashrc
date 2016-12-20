# .bashrc

BASHRC_BASIC=~/.bashrc.config/bashrc.basic

############################
# Source global definitions
############################

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

############################
# Source local definitions
############################

if [ -f ${BASHRC_BASIC} ]; then
        . ${BASHRC_BASIC}
fi