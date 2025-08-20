#!/bin/bash

source ~/.bash_profile

# License Check
if [ -f "${JEUS_HOME}/license/license_$(hostname)" ]; then
    mv ${JEUS_HOME}/license/license_$(hostname) ${JEUS_HOME}/license/license
else
    mv ${JEUS_HOME}/license/license_tri ${JEUS_HOME}/license/license
fi

dsboot &
tail -F ${JEUS_LOG_HOME}/adminServer/JeusServer.log
