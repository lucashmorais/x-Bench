#!/bin/bash

FULL_PATH=$( readlink -f "$0")
SCRIPT_PATH=$( dirname "$FULL_PATH")
#echo $SCRIPT_PATH

### ### ### ### ### ### ### ### ###
### ### Invoking tests  ### ### ###
### ### ### ### ### ### ### ### ### 

cd "$SCRIPT_PATH"

#Invoking cryptography test
echo Invoking cryptography test
if [ $( ls openaes | wc -l ) -le "0" ]
then
	printf "\t>> Compiling...\n"
	rm -R openaes/* 2>&1  /dev/null
	unzip misc/OpenAES-0.10.0.zip -d openaes/ 2>&1 > /dev/null
	cd openaes
	cmake . 2>&1 > /dev/null
	make "--quiet"
	cd "$SCRIPT_PATH"
	printf "\t>> Finished compiling.\n"
fi
aux=$( python execute_tests_crypt.py )
echo Result: $aux
echo

echo Invoking zip test
if [ ! -f zip/zip30 ];
then
	printf "\t>> Extracting files...\n"
	tar -xf misc/zip30.tar.gz -C zip/
	printf "\t>> Finished extracting files\n"
fi
cd zip/zip30
make -f unix/Makefile generic "--quiet"
cd "$SCRIPT_PATH"
# Invoking zip test
aux=$( python execute_tests_zip.py )
echo Result: $aux
echo

echo Invoking browser test
if [ $( ls qa-mozmill-tests | wc -l ) -le "0" ]
then
	printf "\t>> Extracting browser tests...\n"
	rm -R qa-mozmill-tests
	unzip misc/qa-mozmill-tests-master.zip 2>&1 > /dev/null
	mv qa-mozmill-tests-master qa-mozmill-tests
	printf "\t Finished extracting browser tests."
fi
aux=$( mozmill -b /usr/bin/firefox -m ./qa-mozmill-tests/firefox/tests/endurance/manifest.ini 2>&1 | awk -F"( |ms)" 'BEGIN { time = 0 } /finished in/ { time += $7 } END { print time }' )
echo Result: $aux
echo

# Invoking the video playback test
echo Invoking video playback test
cd video
cp teste.avi.7z aux.7z
p7zip -d teste.avi.7z 2>&1 > /dev/null
aux=$( ./dframes.sh  )
echo Result: $aux
rm *.avi 2>&1 > /dev/null
mv aux.7z teste.avi.7z
cd "$SCRIPT_PATH"
echo

# Invoking the HD test
echo Invoking HD test
aux=$( jhd-tester/jhd-tester.sh )
rm -R jhd-tester/testdir 2>&1 > /dev/null
echo Result: $aux
