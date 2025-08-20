#!/bin/bash

source ~/.bash_profile
mkdir -p ${JEUS_LOG_HOME}/{gclog,dump,nodeManager}

LOGDATE=`date "+%y%m%d%H%M%S"`
nohup startNodeManager > $JEUS_LOG_HOME/nodeManager/nm_$LOGDATE.log &

dsa "boot -nodes `hostname`"
tail -F $JEUS_LOG_HOME/nodeManager/nm_$LOGDATE.log
