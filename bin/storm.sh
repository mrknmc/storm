#!/usr/bin/env bash

# good standards
: ${JAVA_CMD:=$JAVA_HOME/bin/java}
: ${STORM_DIR:=$HOME/apache-storm}
: ${CONFFILE=""}
: ${USER_CONF_DIR:=$HOME/.storm}

# set memory to at least 1.7G
: ${JVM_OPTS:="-Xmx1700M"}

CLASSPATH="$STORM_DIR/lib/*:$1:$STORM_DIR/conf:$STORM_DIR/bin"

# Set profiling if needed
if [ -z "$AGENTPATH" ];
	then AGENTPATH="";
	else AGENTPATH="-agentpath:${AGENTPATH}";
fi

echo "java $AGENTPATH $JVM_OPTS -Dstorm.home=$STORM_DIR -Dstorm.conf.file=$CONFFILE -cp $CLASSPATH -Dstorm.jar=$1 $2 $3"
java $AGENTPATH $JVM_OPTS -Dstorm.home=$STORM_DIR -Dstorm.conf.file=$CONFFILE -cp $CLASSPATH -Dstorm.jar=$1 $2 $3
