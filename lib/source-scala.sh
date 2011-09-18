#!/bin/bash

function use_typesafe() {
    use SCALA_HOME /opt/personal/pkg/typesafe-stack
    export AKKA_HOME=/opt/personal/pkg/typesafe-stack
}

function use_scala() {
    use SCALA_HOME /opt/personal/pkg/scala
}

function use_scalate() {
    use SCALATE_HOME /opt/personal/pkg/scalate-1.5.2
}

function use_jrebel() {
    export JREBELHOME=/opt/personal/pkg/ZeroTurnaround/JRebel
    export SBT_OPTS="-noverify -javaagent:$JREBELHOME/jrebel.jar"
    export MAVENOPTS="-noverify -javaagent:$JREBELHOME/jrebel.jar"
}

# vim: sts=4 sw=4 ts=4 et ft=sh
