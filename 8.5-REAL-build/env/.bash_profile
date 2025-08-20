#=============================================================
# COMMON ENV                                         @TmaxSoft
#=============================================================
umask 077
EDITOR=vi
export EDITOR
set -o vi
export PS1="[\$LOGNAME@`hostname`:\$PWD]$ "
export JAVA_HOME=/sw/java
export PATH=$JAVA_HOME/bin:$PATH
#=============================================================
# JEUS ENV                                           @TmaxSoft
#=============================================================
export JEUS_HOME=/sw/jeus
export JEUS_LOG_HOME=${JEUS_HOME}/logs
export PATH="${PATH}:${JEUS_HOME}/bin:${JEUS_HOME}/lib/system"
#export PATH="${PATH}:${JEUS_HOME}/webserver/bin"
#=============================================================
# JEUS DomainAdminServer Set                         @TmaxSoft
#=============================================================
export DOMAIN_NAME=khis_domain
export DAS_HOSTNAME=jeus-admin
export DAS_PORT=10000
export DAS_URL=${DAS_HOSTNAME}:${DAS_PORT}
export ENCODE_FILE=${JEUS_HOME}/bin/jeusEncode
#=============================================================
# JEUS Alias                                         @TmaxSoft
#=============================================================
alias jhome='cd ${JEUS_HOME}'
alias jcfg='cd ${JEUS_HOME}/domains/${DOMAIN_NAME}/config'
alias jbin='cd ${JEUS_HOME}/bin'
alias jlog='cd ${JEUS_LOG_HOME}'
alias pp='ps -ef | grep '
alias vi='vim'

# JDK 8 
#-Xms2048m -Xmx2048m
#-XX:MetaspaceSize=256m 
#-XX:MaxMetaspaceSize=512m 
#-verbose:gc 
#-XX:+PrintGCDetails 
#-XX:+PrintGCTimeStamps 
#-XX:+PrintGCDateStamps 
#-XX:+PrintHeapAtGC
#-Xloggc:${JEUS_LOG_HOME}/gclog/MS_NAME_gc.log
#-XX:+HeapDumpOnOutOfMemoryError
#-XX:HeapDumpPath=${JEUS_LOG_HOME}/dump/

# JDK 11
#-Xms2048m -Xmx2048m
#-XX:MetaspaceSize=256m 
#-XX:MaxMetaspaceSize=512m 
#-verbose:gc 
#-XX:+UseG1GC
#-Xlog:gc:file=${JEUS_LOG_HOME}/gclog/MS_NAME_gc.log:time,pid,level,tags
#-XX:+HeapDumpOnOutOfMemoryError
#-XX:HeapDumpPath=${JEUS_LOG_HOME}/dump/
