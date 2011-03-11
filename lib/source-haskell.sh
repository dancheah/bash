#!/bin/bash

function use_cabal {
    use MY_CABAL_HOME ${HOME}/.cabal
}

function use_mac_cabal {
    use MY_CABAL_HOME ${HOME}/Library/Haskell
}

function use_ghc {
    use MY_GHC_HOME ${HOME}/ghc6
    use_cabal
}


# vim: sts=4 sw=4 ts=4 et ft=sh
