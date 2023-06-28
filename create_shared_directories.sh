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
		
		if [[ ! -d "$shared" ]]
		then
		    #echo $shared
		    user=$(echo $line|cut -f1 -d":")
		    grup=$(id -n -g $user)
		    sudo mkdir -p "$shared" 2>/dev/null
		    sudo chown $user.$grup $shared
		fi

		
		
		####
	fi


done <<<$(cat /etc/passwd)
