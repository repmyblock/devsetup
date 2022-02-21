#!/bin/sh

FILE=$1
echo "FILE: $FILE"
NEWFILE=`echo $FILE | sed 's/Img-\([0-9]*\)-\([0-9]*\).jpg/Img-\1.jpg/g'`
echo "Newfile: $NEWFILE"

if [ -f $NEWFILE ]
then
	echo "$file found."
else
	mv $FILE $NEWFILE
	echo "$file not found."
fi
