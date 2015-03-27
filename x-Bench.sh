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

# Invoking compiling test
echo Invoking compiling test
NUM_PROC=$( nproc )
printf "\t>> Number of detected processors: %d\n" $NUM_PROC
if [ ! -d compiling ];
then
	mkdir compiling 2> /dev/null
elif [ $( ls -l compiling | wc -l ) -ge 2 ]
then
	rm -r compiling/* 2>&1 > /dev/null
fi
tar -xf misc/fftw-3.3.4.tar.gz -C compiling
cd compiling/fftw-3.3.4
./configure --quiet 2>&1 > /dev/null
result[0]=$( /usr/bin/time -f "%e" sh -c "make -j $NUM_PROC --quiet 2>&1 > /dev/null" 2>&1 2>&1 )
cd "$SCRIPT_PATH"


# Invoking cryptography test
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


# Invoking browser test
echo Invoking browser test
result[2]=$( mozmill-env/firefox_test.sh )


# Invoking zip test
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


# Invoking image processing test
echo Invoking image processing test
result[6]=$( imageprocessing/script.sh )



weights=( 1 1 2 1 3 1 1 )
#Adicionar aqui os resultados da máquina de referência
reference=( 28.06 44 384565 7.93 139.0352 566 7.43 )
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
        inv=$( awk "BEGIN{ print 2 * ${reference[$i]}/${result[$i]} }" )
        echo inv: $inv
        log[$i]=$( awk "BEGIN{ print log($inv)/log(2) }" )
        echo log: ${log[$i]}
        mult=$( awk "BEGIN{ printf ${log[$i]}*${weights[$i]} }" )
        echo mult: $mult
        final=$( awk "BEGIN{ printf(\"%f\", $final + $mult) }" )
        echo final: $final
        echo
done
echo

final=$( awk "BEGIN{ printf(\"%.1f\", $final / $sum_weights) }" )
echo Final score: $final

cd "$SCRIPT_PATH"
rm -R html_result
unzip misc/html_result.zip -d "$SCRIPT_PATH" 2>&1 > /dev/null

result_string=${log[0]}

for i in ${log[@]:1}
do
        result_string="$result_string $i"
done

echo result string: $result_string

gawk -f html_gen.awk -v total=$final -v res="$result_string" html_result/result.js > result.tmp
mv result.tmp html_result/result.js
firefox html_result/result.html 2>&1 > /dev/null
