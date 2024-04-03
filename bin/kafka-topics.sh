#!/bin/bash
# Create topic

exec $(dirname $0)/kafka-run-class.sh org.apache.kafka.tools.TopicCommand "$@"