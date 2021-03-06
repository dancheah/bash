#!/bin/bash
function use_rvm() {
    export CC=gcc-4.2
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

    # default gemset to use
    rvm gemset use jekyll
}

# vim: sts=4 sw=4 ts=4 et ft=sh
