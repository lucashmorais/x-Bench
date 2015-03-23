#!/bin/bash

SCRIPT_PATH="$( readlink -f "." )"


### ### ### ### ### ### ### ### ###
### ### Invoking tests  ### ### ###
### ### ### ### ### ### ### ### ### 

# Invoking cryptography test
aux=$( python "$SCRIPT_PATH"/execute_tests_crypt.py 1 )
echo cryptography test: $aux

# Invoking zip test
aux=$( python "$SCRIPT_PATH"/execute_tests_crypt.py 1 )
echo zip test: $aux

# Invoking browser test
aux=$( mozmill -b /usr/bin/firefox -m "$SCRIPT_PATH/qa-mozmill-tests/firefox/tests/endurance/manifest.ini" 2>&1 | awk -F"( |ms)" 'BEGIN { time = 0 } /finished in/ { time += $7 } END { print time }' )
echo browser test: $aux

# Invoking the video playback test
cp $SCRIPT_PATH/video/teste.avi.7z $SCRIPT_PATH/video/aux.7z
p7zip -d $SCRIPT_PATH/video/teste.avi.7z
aux=$( $SCRIPT_PATH/video/dframes.sh  )
echo video test: $aux
rm $SCRIPT_PATH/video/*.avi
mv $SCRIPT_PATH/video/aux.7z $SCRIPT_PATH/video/teste.avi.7z

# Invoking the HD test
aux=$( "$SCRIPT_PATH"/jhd-tester.sh )
echo hd test: $aux
