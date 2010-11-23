#!/bin/bash

function use_fsharp {
    export FSHARP_HOME=/opt/personal/pkg/FSharp-2.0.0.1
    export MONO_PATH=$FSHARP_HOME/bin:$FSHARP_HOME/powerpack:$FSHARP_HOME/generic-bin
    alias fsi="mono $FSHARP_HOME/bin/fsi.exe" 
    alias fsc="mono $FSHARP_HOME/bin/fsc.exe" 
}


# vim: sts=4 sw=4 ts=4 et ft=sh
