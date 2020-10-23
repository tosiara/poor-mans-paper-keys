#!/bin/bash

if [ -z "$1" ]
then
	echo "Usage: $0 message.txt"
	exit 1
fi

echo "Writing checksum into $1.checksum (will be overwritten)"
rm -f "$1.checksum"
echo ""

while IFS= read -r line
do
	checksum=`echo -n "$line" | md5sum | cut -b -4`
	echo "$line    $checksum"
	echo "$checksum" >> "$1.checksum"
done < "$1"

