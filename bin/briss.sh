#!/bin/sh -xv

BRISS_HOME=/opt/personal/pkg/briss-0.0.13

java -Xms128m -Xmx1024m -jar ${BRISS_HOME}/briss-0.0.13.jar $*
