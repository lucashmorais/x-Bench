#!/bin/bash

FULL_PATH=$( readlink -f $0 )
SCRIPT_PATH=$( dirname "$FULL_PATH" )

cd "$SCRIPT_PATH"

for i in ppm/*.tar.bz2
do
	tar -xf $i -C ppm/ &
done
wait

/usr/bin/time 2>&1 -f "%e" ./core_script.sh 

rm ppm/*.ppm
