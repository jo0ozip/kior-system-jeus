#!/bin/bash

source ~/.bash_profile
mkdir -p ${JEUS_LOG_HOME}/{gclog,dump,nodeManager}

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

startManagedServer -dasurl $DAS_URL -domain $DOMAIN_NAME -server `hostname` -u wasadmin -cachelogin -f $ENCODE_FILE -monNM --verbose
