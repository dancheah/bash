#!/bin/bash

function use_rakudo() {
    use RAKUDO_HOME /opt/personal/pkg/rakudo
}

function use_default_locallib() {
    export PRE_LOCALLIB_PATH=$PATH
    export PATH="${HOME}/perl5/locallib/default/bin:$PATH"
    unset PERL5LIB
    eval $(perl -Mlocal::lib=${HOME}/perl5/locallib/default)
}

function use_perlbrew_no_default {
    source ${HOME}/perl5/perlbrew/etc/bashrc
}

function use_perlbrew() {
    use_perlbrew_no_default
    use_default_locallib
}

function use_locallib() {
    # restore original path
    export PATH=$PRE_LOCALLIB_PATH
    unset PERL5LIB
    eval $(perl -Mlocal::lib=$1)
}

# vim: sts=4 sw=4 ts=4 et ft=sh
