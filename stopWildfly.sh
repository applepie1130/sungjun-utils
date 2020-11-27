#!/bin/bash

######################################################
# Descriptin : To kill unfinished Wildfly Server process
# Date       : 2016.10.30
# Modified   : 2020.11.27
# Author     : sungjun.kim6@cj.net
######################################################
 

# Initialize arguments
FILENAME=$0
ARGUMENT=$1

echo "======= Start : Killing Wildfly Server process ======="

if [[ $# -eq 0 ]]; then
	PID=`ps -afx | grep -p 'mall\|mcci' | grep -v 'grep' | grep -v $FILENAME | awk '{print $2}'`

elif [[ $ARGUMENT == 'mall' ]]; then
	PID=`ps -afx | grep -p 'mall' | grep -v 'grep' | grep -v $FILENAME | awk '{print $2}'`

elif [[ $ARGUMENT == 'cci' ]]; then
	PID=`ps -afx | grep -p 'mcci' | grep -v 'grep' | grep -v $FILENAME | awk '{print $2}'`

else 
	PID=''
fi

if [[ $PID != '' ]]; then
	#kill -9 $PID
	PID=`echo $PID | tr -d '\r'`
	echo "Killed process [PID:$PID]"
else
	echo "Wildfly Server is not running!!"
fi

echo "======= End   : Killing Wildfly Server process ======="
