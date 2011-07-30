#!/bin/bash

export PERLBREW_ROOT=${HOME}/.perl5/perlbrew
export MY_PERL_LOCALLIB_ROOT=${HOME}/.perl5/locallib

function use_rakudo() {
    use RAKUDO_HOME /opt/personal/pkg/rakudo/install
}

function use_default_locallib() {
    export PRE_LOCALLIB_PATH=$PATH
    export PATH="${MY_PERL_LOCALLIB_ROOT}/default/bin:$PATH"
    unset PERL5LIB
    eval $(perl -Mlocal::lib=${MY_PERL_LOCALLIB_ROOT}/default)
}

function use_perlbrew_no_default {
    source ${PERLBREW_ROOT}/etc/bashrc
}

function use_perlbrew() {
    use_perlbrew_no_default
    use_default_locallib
}

function use_locallib() {
    # restore original path
    export PATH=$PRE_LOCALLIB_PATH
    unset PERL5LIB
    eval $(perl -Mlocal::lib=${MY_PERL_LOCALLIB_ROOT}/$1)
}

# vim: sts=4 sw=4 ts=4 et ft=sh
