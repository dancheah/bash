function use() {
    eval $(use.pl --home-var $1 --home-dir $2)
}

function addtopath() {
#    if [ "X${1}X" == "XX" ]; then
    export PATH=`pwd`:$PATH
#    else
# TODO: Need to figure out how to dereference
# the $1 parameter. I think it's $$1
#        export $1=
#    fi
}

# vim: sts=4 sw=4 ts=4 et ft=sh
