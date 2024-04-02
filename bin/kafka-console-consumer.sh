#!/bin/bash
# Usage: bin/kafka-console-consumer.sh

if [ "x$KAFKA_HEAP_OPTS" = "x" ]; then
    export KAFKA_HEAP_OPTS="-Xmx512M"
fi

exec $(dirname $0)/kafka-run-class.sh org.apache.kafka.tools.consumer.ConsoleConsumer "$@"