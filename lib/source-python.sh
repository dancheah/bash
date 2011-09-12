function use_pythonbrew {
    use_pythonbrew_no_default
    use_default_virtualenv
}

function use_pythonbrew_no_default {
    export CC=gcc-4.2
    source ${HOME}/.pythonbrew/etc/bashrc
}

function use_default_virtualenv {
    use_virtualenv
    workon default
}

function use_virtualenv {
    if [ -f /etc/bash_completion.d/virtualenvwrapper ]; then
        source /etc/bash_completion.d/virtualenvwrapper
    else
        source `which virtualenvwrapper.sh`
    fi
}

# vim: sts=4 sw=4 ts=4 et ft=sh
