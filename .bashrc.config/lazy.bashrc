#!/bin/bash

alias enable=bash_activate_configuration_file
alias disable=bash_deactiate_configuration_file

function bash_activate_configuration_file ()
{
    config=$1
    active=active
    config_dir=~/.bashrc.config

    cd $config_dir

    if [ -a ${config} ]
    then
    {
	mv ${config} ${config}.${active}
	echo "$config has been activated"
    }
    else
    {
	if [ -f ${config}.${active} ]
	then
	{
	    echo "$config is already activated"
        }
	else
	{
	    echo "$config: File does not exist!"
	}
	fi
    }
    fi   
    bash
}

function bash_deactiate_configuration_file ()
{
    config=$1
    active=active
    config_dir=~/.bashrc.config

    cd $config_dir

    config=${config%.$active}

    if [ -f ${config}.${active} ]
    then
    {
        mv ${config}.${active} ${config}
        echo "$config has been deactivated"
    }
    else
    {    
        if [ -f ${config} ]
        then
        {
            echo "$config is already deactivated"
        }
        else
        {
            echo "$config: File does not exist!"
        }
        fi
    }
    fi
    bash
}