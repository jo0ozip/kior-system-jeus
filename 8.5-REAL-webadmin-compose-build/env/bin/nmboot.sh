#!/bin/bash

source ~/.bash_profile
mkdir -p ${JEUS_LOG_HOME}/nodeManager

# SET jeusEncode ###########################################################
if [ -z ${DOMAIN_NAME} ]; then export DOMAIN_NAME=jeus_domain; fi
sed -i "s|%DOMAIN_NAME%|${DOMAIN_NAME}|g" ${JEUS_HOME}/bin/jeusEncode

# SET jeus.properties ######################################################
if [ -z ${JAVA_HOME} ]; then export JAVA_HOME=/usr/lib/jvm/openjdk; fi
sed -i "s|%JAVA_HOME%|${JAVA_HOME}|g" ${JEUS_HOME}/bin/jeus.properties



# License Check
if [ -f "${JEUS_HOME}/license/license_$(hostname)" ]; then
    mv ${JEUS_HOME}/license/license_$(hostname) ${JEUS_HOME}/license/license
else
    mv ${JEUS_HOME}/license/license_tri ${JEUS_HOME}/license/license
fi

LOGDATE=`date "+%y%m%d%H%M%S"`
nohup startNodeManager > $JEUS_LOG_HOME/nodeManager/nm_$LOGDATE.log &
tail -F $JEUS_LOG_HOME/nodeManager/nm_$LOGDATE.log
