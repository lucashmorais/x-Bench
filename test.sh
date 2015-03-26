#!/bin/bash

weights=( 1 1 2 1 3 1 1 )
result=( 1 1.1 3.5 7.3 8.8 1.3 1 )
constant=2.64
size=${#weights[*]}
size=$(( size - 1))
echo $size
echo

sum_weights=0
final=0

for i in $( seq 0 $size ) 
do
	sum_weights=$( awk "BEGIN{ print $sum_weights + ${weights[$i]} }" )
done

for i in $( seq 0 $size )
do
	echo result: ${result[$i]}
	echo i: $i
	inv=$( awk "BEGIN{ print 1/${result[$i]} }" )
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
echo final: $final

