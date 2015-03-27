#!/bin/bash

result=( 15.55 43 233946 6.11 8.367691 591 5.64 )
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
