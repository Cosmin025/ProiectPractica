#!/bin/bash

while read line
do

shell=$(echo $line|cut -f7 -d":")

	if [[ "$shell" = "/bin/bash" ]]
	then
	
		user=$(echo $line|cut -f1 -d":")
		backup="/home/dir_backups/$user"
		####
		
		if [[ ! -d "$backup" ]]
		then
		    
		    grup=$(id -n -g $user)
		    echo "1234"|sudo -S mkdir -p "$backup" 2>/dev/null
		    echo "1234"|sudo -S chown $user.$grup $backup
		fi
		
		####
	fi


done <<<$(cat /etc/passwd)
