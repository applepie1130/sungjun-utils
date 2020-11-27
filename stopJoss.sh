#!/bin/bash

######################################################
# Descriptin : To kill unfinished Jboss Server process
# Date       : 2016.10.30
# Author     : sungjun.kim6@cj.net
######################################################
 

# Initialize arguments
FILENAME=$0
ARGUMENT=$1

echo "======= Start : Killing Jboss Server process ======="

if [[ $# -eq 0 ]]; then
	PID=`ps -afx | grep -p 'Kakao\|NateOn' | grep -v 'grep' | grep -v $FILENAME | awk '{print $2}'`

elif [[ $ARGUMENT == 'mall' ]]; then
	PID=`ps -afx | grep -p 'Kakao' | grep -v 'grep' | grep -v $FILENAME | awk '{print $2}'`

elif [[ $ARGUMENT == 'cci' ]]; then
	PID=`ps -afx | grep -p 'NateOn' | grep -v 'grep' | grep -v $FILENAME | awk '{print $2}'`

else 
	PID=''
fi

if [[ $PID != '' ]]; then
	#kill -9 $PID
	PID=`echo $PID | tr -d '\r'`
	echo "Killed process [PID:$PID]"
else
	echo "Jboss Server is not running!!"
fi

echo "======= End   : Killing Jboss Server process ======="
