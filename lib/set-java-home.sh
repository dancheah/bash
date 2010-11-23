function set_java_home() {
    if [ -d "/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home" ]; then 
        use JAVA_HOME "/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home" 
    elif [ -d "/usr/local/jdk1.6" ]; then
        use JAVA_HOME /usr/local/jdk1.6
    elif [ -d "/usr/lib/jvm/java-6-sun" ]; then
        use JAVA_HOME /usr/lib/jvm/java-6-sun
    else 
        use JAVA_HOME /usr/lib/jvm/java-6-openjdk
    fi
}

set_java_home

# vim: sts=4 sw=4 ts=4 et ft=sh
