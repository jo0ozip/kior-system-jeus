#=============================================================
# COMMON ENV                                         @TmaxSoft
#=============================================================
umask 077
EDITOR=vi
export EDITOR
set -o vi
export PS1="[\$LOGNAME@`hostname`:\$PWD]$ "
export JAVA_HOME=${JAVA_HOME}
export PATH=$JAVA_HOME/bin:$PATH
#=============================================================
# JEUS ENV                                           @TmaxSoft
#=============================================================
export JEUS_HOME=${JEUS_HOME}
export JEUS_LOG_HOME=${JEUS_LOG_HOME}
export PATH="${PATH}:${JEUS_HOME}/bin:${JEUS_HOME}/lib/system"
#export PATH="${PATH}:${JEUS_HOME}/webserver/bin"
#=============================================================
# JEUS DomainAdminServer Set                         @TmaxSoft
#=============================================================
export DOMAIN_NAME=${DOMAIN_NAME}
export DAS_HOSTNAME=adminServer
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

# JDK 17
#-Xms2048m -Xmx2048m
#-XX:MetaspaceSize=256m
#-XX:MaxMetaspaceSize=512m
#-Xlog:gc*:file=${JEUS_LOG_HOME}/gclog/MS_NAME_gc.log:time,uptime,level,tags:filecount=10,filesize=20m
#-XX:+HeapDumpOnOutOfMemoryError
#-XX:HeapDumpPath=${JEUS_LOG_HOME}/dump/
#-XX:+ExitOnOutOfMemoryError       # OOM 시 프로세스 즉시 종료 (선택)
#-XX:+HeapDumpOnOutOfMemoryError
#-XX:HeapDumpPath=${JEUS_LOG_HOME}/dump/
