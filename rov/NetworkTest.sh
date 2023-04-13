#!/bin/bash


IP='192.168.1.1'

COUNTER=0
HELP=5

while true;
do

	printf "The value of the counter is COUNTER=%d\n" $COUNTE	
	sleep 5




	fping -c1 -t300 $IP 2>/dev/null 1>/dev/null
	if [ "$?" = 0 ]
	then
		echo "Host found"
		if [ $COUNTER -gt $HELP ]
		then
			echo "play TAKK"
			mpg321 takk-for-hjelpa.mp3
			COUNTER=0
		fi
	else
		echo "Host not found"
		let COUNTER++

		if [ $COUNTER -gt $HELP ]
		then
			echo "play HELP"
			mpg321 hjelp-meg.mp3
		fi


	fi


done
