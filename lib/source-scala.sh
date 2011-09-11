#!/bin/bash

function use_typesafe() {
    use SCALA_HOME /opt/personal/pkg/typesafe-stack
    export AKKA_HOME=/opt/personal/pkg/typesafe-stack
}

function use_scala() {
    use SCALA_HOME /opt/personal/pkg/scala
}

# vim: sts=4 sw=4 ts=4 et ft=sh
