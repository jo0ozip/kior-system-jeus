#!/bin/bash

source ~/.bash_profile
dsboot &
tail -F ${JEUS_LOG_HOME}/adminServer/JeusServer.log
