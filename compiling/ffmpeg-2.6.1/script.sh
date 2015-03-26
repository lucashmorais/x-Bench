#!/bin/bash
export CC=../GCC/c99-gcc
./configure --cc=$CC
time make >out 
