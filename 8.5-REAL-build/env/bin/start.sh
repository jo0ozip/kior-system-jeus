#!/bin/sh
# REC ######################################################################
export JEUS_JVM_OPT="-Xms2048m -Xmx2048m \
-XX:MetaspaceSize=256m \
-XX:MaxMetaspaceSize=512m \
-Xlog:gc*:file=${JEUS_LOG_HOME}/gclog/${SERVICE_NAME}_gc.log:time,uptime,level,tags:filecount=10,filesize=20m \
-XX:+ExitOnOutOfMemoryError \       
-XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=${JEUS_LOG_HOME}/dump/

# SET jeus.properties ######################################################
if [ -z ${JAVA_HOME} ]; then export JAVA_HOME=/usr/lib/jvm/openjdk; fi
sed -i "s/%JAVA_HOME%/${JAVA_HOME}/g" ${JEUS_HOME}/bin/jeus.properties

# SET domain.xml ###########################################################
if [ -z ${SERVICE_NAME} ]; then export SERVICE_NAME=ManagedServer; fi
sed -i "s/%SERVICE_NAME%/${SERVICE_NAME}/g" ${JEUS_HOME}/domains/${DOMAIN_NAME}/config/domain.xml

if [ -z ${JVM_OPT} ]; then export JVM_OPT=${JEUS_JVM_OPT}; fi
sed -i "s/%JVM_OPT%/${JVM_OPT}/g" ${JEUS_HOME}/domains/${DOMAIN_NAME}/config/domain.xml

if [ -z ${ENCODING} ]; then export ENCODING=UTF-8; fi
sed -i "s/%ENCODING%/${ENCODING}/g" ${JEUS_HOME}/domains/${DOMAIN_NAME}/config/domain.xml

if [ -z ${HTTP_THREAD_MIN} ]; then export HTTP_THREAD_MIN=100; fi
sed -i "s/%HTTP_THREAD_MIN%/${HTTP_THREAD_MIN}/g" ${JEUS_HOME}/domains/${DOMAIN_NAME}/config/domain.xml

if [ -z ${HTTP_THREAD_MAX} ]; then export HTTP_THREAD_MAX=100; fi
sed -i "s/%HTTP_THREAD_MAX%/${HTTP_THREAD_MAX}/g" ${JEUS_HOME}/domains/${DOMAIN_NAME}/config/domain.xml


startDomainAdminServer -domain $DOMAIN_NAME -u wasadmin -cachelogin -f $ENCODE_FILE
