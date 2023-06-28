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
		echo "1234"|sudo -S rm -r "$shared/*"
		echo "1234"|sudo -S rsync -a --delete "/home/main-shared/" "$shared/"
		echo "1234"|sudo -S ls "/home/main-shared" > /dev/null
		
		fi


	done <<<$(cat /etc/passwd)


