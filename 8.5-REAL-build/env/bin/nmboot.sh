#!/bin/bash

source ~/.bash_profile
mkdir -p ${JEUS_LOG_HOME}/nodeManager

# License Check
if [ -f "${JEUS_HOME}/license/license_$(hostname)" ]; then
    mv ${JEUS_HOME}/license/license_$(hostname) ${JEUS_HOME}/license/license
else
    mv ${JEUS_HOME}/license/license_tri ${JEUS_HOME}/license/license
fi

LOGDATE=`date "+%y%m%d%H%M%S"`
nohup startNodeManager > $JEUS_LOG_HOME/nodeManager/nm_$LOGDATE.log &

until nc -z localhost 9736; do
    echo "Waiting for NodeManager..."
    sleep 2
done

dsa "boot -nodes `hostname`"

tail -F $JEUS_LOG_HOME/nodeManager/nm_$LOGDATE.log
