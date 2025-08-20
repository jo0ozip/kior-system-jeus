#!/bin/bash

source ~/.bash_profile

mkdir -p ${JEUS_LOG_HOME}/{gclog,dump,nodeManager}

# License Check
if [ -f "${JEUS_HOME}/license/license_$(hostname)" ]; then
    mv ${JEUS_HOME}/license/license_$(hostname) ${JEUS_HOME}/license/license
else
    mv ${JEUS_HOME}/license/license_tri ${JEUS_HOME}/license/license
fi

startManagedServer -dasurl $DAS_URL -domain $DOMAIN_NAME -server server1 -u wasadmin -cachelogin -f $ENCODE_FILE -monNM --verbose
