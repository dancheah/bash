function ws() {
    pushd .
    cd ~/workplace
}

function repos() {
    pushd .
    cd ~/workplace/repos/$1
}

function _repos_options() {
    (for f in ~/workplace/repos/*; do echo $f; done) | sed 's|^\./||' | sed 's|/Users/dc/workplace/repos/||' | sort
}

function abspath() {
    perl -MCwd -e 'print Cwd::abs_path($ARGV[0])."\n"' $1
}

if [ -n "$BASH" ]; then
    _repos_completion ()
    {
        local cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "`_repos_options`" -- ${cur}) )
    }
    complete -o default -o nospace -F _repos_completion repos
fi
