#!/bin/bash

user=$(whoami)
backup_dir="/home/dir_backups/$user"

if [[ ! -d $backup_dir ]]; then
    mkdir -p $backup_dir
fi

while true; do
    choice=$(zenity --title "Backup Menu" --width=300 --height=200 --list \
        --column="Option" \
        "Backup a directory" \
        "Backup a file" \
        "Clear backup directory" \
        "Exit")

    case $choice in
        "Backup a directory")
            path=$(zenity --title "Backup Path" --file-selection --directory --filename="/home/$user")
            if [[ -z $path ]]; then
                break
            fi
            
            name=$(basename "$path")
            exista=$(ls -R "$backup_dir" | grep -w "$name")
            
            if [[ -n $exista ]] 
            then
                echo "1234" | sudo -S rm -r "$backup_dir/$name"
                cp -r "$path" "$backup_dir/$name"
                zenity --info --text "Directory '$name' is up to date."
            else
                cp -r "$path" "$backup_dir/$name"
                zenity --info --text "Directory '$name' added to backups."
            fi
            ;;
            
        "Backup a file")
            path=$(zenity --title "Backup Path" --file-selection --filename="/home/$user")
            if [[ -z $path ]]; then
                break
            fi
            
            name=$(basename "$path")
            exista=$(ls -R "$backup_dir" | grep -w "$name")
            
            if [[ -n $exista ]]
            then
                echo "1234" | sudo -S rm -r "$backup_dir/$name"
                cp "$path" "$backup_dir/$name"
                zenity --info --text "File '$name' is up to date."
            else
                cp "$path" "$backup_dir/$name"
                zenity --info --text "File '$name' added to backups."
            fi
            
            ;;

	"Clear backup directory")
	echo "1234"|sudo -S rm -rf "$backup_dir"/*
	zenity --info --text "Backup directory for the user $user has been cleared"

	;;

        "Exit")
            break
            ;;

        *)
            zenity --error --text "Invalid option."
            ;;
    esac
done

