#!/bin/bash

FULL_PATH=$( readlink -f "$0")
SCRIPT_PATH=$( dirname "$FULL_PATH")
#echo $SCRIPT_PATH

#Weights of each of the benchmarks
benchmarks=( compile encryption browsing compression HD video-playback image-processing )
weights=( 1 1 2 1 3 1 1)

### ### ### ### ### ### ### ### ###
### ### Invoking tests  ### ### ###
### ### ### ### ### ### ### ### ### 

cd "$SCRIPT_PATH"

##############
# --- Compilation test here!
result[0]=1
##############

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
result[1]=$( python execute_tests_crypt.py )

 >/dev/null 2> /dev/null
echo Invoking browser test
if [ $( ls qa-mozmill-tests | wc -l ) -le "0" ]
then
	printf "\t>> Extracting browser tests...\n"
	rm -R qa-mozmill-tests
	unzip misc/qa-mozmill-tests-master.zip 2>&1 > /dev/null
	mv qa-mozmill-tests-master qa-mozmill-tests
	printf "\t Finished extracting browser tests.\n"
fi
result[2]=$( mozmill -b /usr/bin/firefox -m ./qa-mozmill-tests/firefox/tests/endurance/manifest.ini 2>&1 | awk -F"( |ms)" 'BEGIN { time = 0 } /finished in/ { time += $7 } END { print time }' )

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
result[3]=$( python execute_tests_zip.py )

# Invoking the HD test
echo Invoking HD test
result[4]=$( jhd-tester/jhd-tester.sh )
rm -R jhd-tester/testdir 2>&1 > /dev/null

# Invoking the video playback test
echo Invoking video playback test
cd video
cp teste.avi.7z aux.7z
p7zip -d teste.avi.7z 2>&1 > /dev/null
result[5]=$( ./dframes.sh  )
rm *.avi 2>&1 > /dev/null
mv aux.7z teste.avi.7z
cd "$SCRIPT_PATH"

#####################
#--- Image test here!
result[6]=1
#####################

weights=( 1 1 2 1 3 1 1 )
#Adicionar aqui os resultados da máquina de referência
reference=( 1 1 1 1 1 1 1 )
constant=2.64
size=${#weights[*]}
size=$(( size - 1))

sum_weights=0
final=0

for i in $( seq 0 $size )
do
        sum_weights=$( awk "BEGIN{ print $sum_weights + ${weights[$i]} }" )
done

for i in $( seq 0 $size )
do
        echo ${benchmarks[$i]} result: ${result[$i]}
        echo i: $i
        inv=$( awk "BEGIN{ print ${reference[$i]}/${result[$i]} }" )
        echo inv: $inv
        log=$( awk "BEGIN{ print log($inv)/log(2) }" )
        echo log: $log
        mult=$( awk "BEGIN{ printf $log*${weights[$i]} }" )
        echo mult: $mult
        final=$( awk "BEGIN{ printf $final + ($mult) } " )
        echo final: $final
        echo
done
echo

final=$( awk "BEGIN{ printf $final / $sum_weights + $constant }" )
echo Final score: $final

cd "$SCRIPT_PATH"
rm -R html_result
unzip misc/html_result.zip -d "$SCRIPT_PATH" 2>&1 > /dev/null

result_string=${result[0]}

for i in ${result[@]:1}
do
        result_string="$result_string $i"
done

gawk -f html_gen.awk -v total=$final -v res="$result_string" html_result/result.js > result.tmp
mv result.tmp html_result/result.js
firefox html_result/result.html 2>&1 > /dev/null

