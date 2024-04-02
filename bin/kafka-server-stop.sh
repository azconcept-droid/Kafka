#!/bin/bash
# stop kafka server

SIGNAL=${SIGNAL:-TERM}

INPUT_PROCESS_ROLE=$(echo "$@" | grep -o -- '--process-role=[^ ]*' | cut -d'=' -f2)
INPUT_NID=$(echo "$@" | grep -o -- '--node-id=[^ ]*' | cut -d'=' -f2)
if [ -n "$INPUT_NID" ] && [ -n "$INPUT_PROCESS_ROLE" ]; then
  echo "When both node-id and process-role are provided, the value for node-id will take precedence"
fi

OSNAME=$(uname -s)
if [[ "$OSNAME" == "OS/390" ]]; then
    if [ -z $JOBNAME ]; then
        JOBNAME="KAFKSTRT"
    fi
    PIDS=$(ps -A -o pid,jobname,comm | grep -i $JOBNAME | grep java | grep -v grep | awk '{print $1}')
elif [[ "$OSNAME" == "OS400" ]]; then
    PIDS=$(ps -Af | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $2}')
else
    PIDS=$(ps ax | grep ' kafka\.Kafka ' | grep java | grep -v grep | awk '{print $1}'| xargs)
fi

if [ -z "$PIDS" ]; then
  echo "No kafka server to stop"
  exit 1
else
  if [ -z "$INPUT_PROCESS_ROLE" ] && [ -z "$INPUT_NID" ]; then
    kill -s $SIGNAL $PIDS
  else
    RelativePathToConfig=$(ps ax | grep ' kafka\.Kafka ' | grep java | grep -v grep | sed 's/--override property=[^ ]*//g' | awk 'NF>1{print $NF}' | xargs)
    IFS=' ' read -ra PIDSArray <<< "$PIDS"
    IFS=' ' read -ra RelativePathArray <<< "$RelativePathToConfig"
    for ((i = 0; i < ${#RelativePathArray[@]}; i++)); do
        AbsolutePathToConfig=$(readlink -f "${RelativePathArray[i]}")
        if [ -z "$AbsolutePathToConfig" ] ; then
          echo "Can not find the configuration file in the current directory. Please make sure the kafka stop process and the start process are called in the same directory."
          exit 1
        fi
        if [ -n "$INPUT_NID" ] ; then
            keyword="node.id="
            NID=$(sed -n "/$keyword/ { s/$keyword//p; q; }" "$AbsolutePathToConfig")
        elif [ -n "$INPUT_PROCESS_ROLE" ] && [ -z "$INPUT_NID" ]; then
            keyword="process.roles="
            PROCESS_ROLE=$(sed -n "/$keyword/ { s/$keyword//p; q; }" "$AbsolutePathToConfig")
        fi
        if [ -n "$INPUT_PROCESS_ROLE" ] && [ "$PROCESS_ROLE" == "$INPUT_PROCESS_ROLE" ] || [ -n "$INPUT_NID" ] && [ "$NID" == "$INPUT_NID" ]; then
          kill -s $SIGNAL ${PIDSArray[i]}
        fi
    done
  fi
fi