#!/bin/bash
# zookeeper server stop

SIGNAL=${SIGNAL:-TERM}

OSNAME=$(uname -s)
if [[ "$OSNAME" == "OS/390" ]]; then
    if [ -z $JOBNAME ]; then
        JOBNAME="ZKEESTRT"
    fi
    PIDS=$(ps -A -o pid,jobname,comm | grep -i $JOBNAME | grep java | grep -v grep | awk '{print $1}')
elif [[ "$OSNAME" == "OS400" ]]; then
    PIDS=$(ps -Af | grep java | grep -i QuorumPeerMain | grep -v grep | awk '{print $2}')
else
    PIDS=$(ps ax | grep java | grep -i QuorumPeerMain | grep -v grep | awk '{print $1}')
fi

if [ -z "$PIDS" ]; then
  echo "No zookeeper server to stop"
  exit 1
else
  kill -s $SIGNAL $PIDS
fi