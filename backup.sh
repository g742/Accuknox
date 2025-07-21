#!/bin/bash
set -xveuo
src="/home/golu/Desktop"
dest="/home/golu/backup"
dd="$(date +%d-%B-%y)"
tar -Pczvf $dest/golu_$dd.tar.gz $src
if [[ $? -eq 0 ]]
then
	echo "backup done"
else
	echo "not done"
fi
