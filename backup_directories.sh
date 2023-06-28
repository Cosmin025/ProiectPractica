#!/bin/bash


user=$(whoami)
backup_dir="/home/dir_backups/$user"

if [[ ! -d $backup_dir ]]
then
	mkdir -p $backup_dir
fi

echo 
echo "------------------"
echo "Backup directories"
echo "------------------"
echo

select item in "Backup directory" "Exit"
do
	
	case $REPLY in
	1)
		echo "Va aflati in /home/$user/git"
		echo "Introduceti calea absoluta a unui director:"
		read dir
		
		if [[ ! -d $dir ]]
		then
		
			if [[ -f $dir ]]
			then
				echo "Acesta este un fisier"
			else
				echo "Aceasta cale nu exista:"
				echo $dir
			fi
		else
			name=$(basename $dir)
			exista=$(ls $backup_dir|egrep -w $name)
			
			if [[ -n $exista ]]
			then
				
				echo "1234"|sudo -S rm -r "$backup_dir/$name"
				cp -r $dir "$backup_dir/$name"
				echo "Directory up to date"
			else
				cp -r $dir "$backup_dir/$name"
				echo "Directory added"
			fi
			
		fi
	;;
	2) 
	echo 
	echo "------------------"
	echo "Exiting backup menu directories"
	echo "------------------"
	echo
		
		exit 0 ;;
	*) echo "Optiune invalida" ;;
	esac
done

