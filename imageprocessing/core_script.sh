#!/bin/bash

cd ppm

if [ ! -d ../jpegOut ];
then
	mkdir ../jpegOut
fi

for i in *.ppm
do
	basename=$( basename $i )
	basename=${basename%.*}
	../cjpeg -quality 100 $i > ../jpegOut/$basename.jpeg
done
wait
