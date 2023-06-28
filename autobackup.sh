#!/bin/bash

lines=$(echo "1234"|sudo -S find ~ -type d -mtime -1|wc -l)

if [[ $lines -gt 0 ]]
then

	user=$(whoami)
	homedir="/home/$user"
	#echo $user
	if [[ -d "home/backups/$user" ]]
	then
	#echo $user
	echo "1234"|sudo -S rm -r "home/backups/$user"
	fi
	
	echo "1234"|sudo -S cp -r $homedir "/home/backups/$user"

fi
