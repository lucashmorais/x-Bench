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

echo $FULL_SCRIPT_PATH
echo $SCRIPT_PATH

rm "$SCRIPT_PATH"/bin/*.class
javac "$SCRIPT_PATH"/src/*.java -d "$SCRIPT_PATH/bin"

java -cp "$SCRIPT_PATH"/bin Main "$TEST_FILES_PATH"
