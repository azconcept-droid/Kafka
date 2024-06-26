#!/bin/bash
# zookeeper server start

if [ $# -lt 1 ];
then
	echo "USAGE: $0 [-daemon] zookeeper.properties"
	exit 1
fi
base_dir=$(dirname $0)

if [ "x$KAFKA_LOG4J_OPTS" = "x" ]; then
    export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$base_dir/../config/log4j.properties"
fi

if [ "x$KAFKA_HEAP_OPTS" = "x" ]; then
    export KAFKA_HEAP_OPTS="-Xmx512M -Xms512M"
fi

EXTRA_ARGS=${EXTRA_ARGS-'-name zookeeper -loggc'}

COMMAND=$1
case $COMMAND in
  -daemon)
     EXTRA_ARGS="-daemon "$EXTRA_ARGS
     shift
     ;;
 *)
     ;;
esac

exec $base_dir/kafka-run-class.sh $EXTRA_ARGS org.apache.zookeeper.server.quorum.QuorumPeerMain "$@"