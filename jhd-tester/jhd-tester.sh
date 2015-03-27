#!/bin/bash
FULL_SCRIPT_PATH=$( readlink -f $0 )
SCRIPT_PATH=$( dirname "$FULL_SCRIPT_PATH" )

TEST_FILES_PATH="$SCRIPT_PATH/testdir"

if [ "$#" -eq 1 ];
then
	TEST_FILES_PATH=$1
elif [ "$#" -gt 1 ];
then
	echo Too many arguments.
	exit
fi

cd "$SCRIPT_PATH"
if [ ! -d bin ];
then
	mkdir bin
elif [ $( ls -l bin | wc -l) -ge 2 ];
then
	rm "$SCRIPT_PATH"/bin/*.class
fi
javac src/*.java -d bin

java -cp bin Main "$TEST_FILES_PATH"
