#!/bin/bash

while read line
do

shell=$(echo $line|cut -f7 -d":")

	if [[ "$shell" = "/bin/bash" ]]
	then
	
	homedir=$(echo $line|cut -f6 -d":")
	#echo $homedir
	
	shared="$homedir/shared"
	
	####

	####
	declare -i lines=$(echo "1234"|sudo -S find $shared -mtime -1|wc -l)
	
	if [[ $lines -gt 0 ]]
	then

	echo "1234"|sudo rsync -a --delete "$shared/" "/home/main-shared/"
	
	fi
	
	fi


done <<<$(cat /etc/passwd)
