#!/bin/bash

if [ -z "$1" ]
then
	echo "Usage: $0 message.txt"
	exit 1
fi

while IFS= read -r line <&3 && IFS= read -r sum <&4
do
	checksum=`echo -n "$line" | md5sum | cut -b -4`
	if [ "$checksum" != "$sum" ]
	then
		echo "BAD: $line calculated $checksum supplied $sum"
	fi
done 3<"$1" 4<"$1.checksum"

