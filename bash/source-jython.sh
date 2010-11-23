#!/bin/bash
function use_jython() {
    export JYTHON_HOME=/opt/personal/pkg/jython2.5.0
    export PRE_JYTHON_PATH=${PATH}
    export PATH=${JYTHON_HOME}/bin:${PRE_JYTHON_PATH}
    export PRE_JYTHON_PS1=${PS1}
    export PS1="(jython) ${PRE_JYTHON_PS1}"
    export PRE_JYTHON_CLASSPATH=${CLASSPATH}
    export CLASSPATH=${CLASSPATH}:${PYTHONPATH}
    export USE_JYTHON=1
}

function nouse_jython() {
    unset JYTHON_HOME
    export PATH=${PRE_JYTHON_PATH}
    export PS1=${PRE_JYTHON_PS1}
    export CLASSPATH=${PRE_JYTHON_CLASSPATH}
    unset PRE_JYTHON_PATH
    unset PRE_JYTHON_PS1
    unset PRE_JYTHON_CLASSPATH
}

function clean_classfiles() {
    find . -name "*.class" -exec rm \{\} \;
}

# vim: sts=4 sw=4 ts=4 et ft=sh  
