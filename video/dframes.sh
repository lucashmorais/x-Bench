#!/bin/bash
SCRIPT_PATH=$( readlink -f "." )

if [ $# -ge "1" ]; then
	MULTIPLIER=$1
else
	MULTIPLIER="0.6"
fi

vlc -vvv --play-and-exit --run-time=5 --rate $MULTIPLIER "$SCRIPT_PATH/teste.avi" 2>&1 | awk '/too late to be displayed/ { print "" }' | wc -l
