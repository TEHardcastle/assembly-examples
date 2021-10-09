#!/bin/bash

mkdir -p bin
mkdir -p obj

for folder in src/*
do
	for FILE in $folder/*
	do
		file_ext=$(echo $FILE | cut -d "." -f "2")
		file_root=$(echo $FILE | cut -d "." -f "1" | cut -d "/" -f "3")
		if [ $file_ext = "s" ]
		then
			as -ggdb $FILE -o obj/$file_root.o
			ld obj/$file_root.o -o bin/$file_root
		fi
	done
done
