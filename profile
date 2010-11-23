# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# if we use mac ports, include those paths
if [ -d "/opt/local" ]; then
    PATH=/opt/local/bin:$PATH
    MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
fi

source $MY_BASH_HOME/bash/functions.sh
source $MY_BASH_HOME/bash/path
source $MY_BASH_HOME/bash/repos.sh
source $MY_BASH_HOME/bash/set-java-home.sh
source $MY_BASH_HOME/bash/source-jython.sh
source $MY_BASH_HOME/bash/source-ruby.sh
source $MY_BASH_HOME/bash/source-perl.sh
source $MY_BASH_HOME/bash/source-haskell.sh
source $MY_BASH_HOME/bash/source-fsharp.sh
# Fallback to the old virtualenv stuff if
# we are not using macports
if [ -f /opt/local/bin/virtualenvwrapper_bashrc-2.6 ];
then
    source /opt/local/bin/virtualenvwrapper_bashrc-2.6 
else
    source $MY_BASH_HOME/virtualenvwrapper-1.24.2/virtualenvwrapper_bashrc
fi
#source $MY_BASH_HOME/bash/source-clojure.sh
#source $HOME/.bash/bfgap2

export MY_PRE_MAVEN_PATH=${PATH}
use MAVEN_HOME /opt/personal/pkg/apache-maven-2.2.1
export MY_PRE_ANT_PATH=${PATH}
use ANT_HOME /opt/personal/pkg/apache-ant-1.8.1

function set_editor() {
    WHICH_EDITOR=`which mvim`
    if [ "X${WHICH_EDITOR}X" == "XX" ]; then
        export EDITOR=vim
    else
        export EDITOR="${WHICH_EDITOR} -f"
    fi
}
set_editor

# vim: sts=4 sw=4 et ft=sh
