#!/bin/bash

user=$(whoami)
backup_dir="/home/dir_backups/$user"

if [[ ! -d $backup_dir ]]; then
    mkdir -p $backup_dir
fi

while true; do
    choice=$(zenity --title "Backup Menu" --width=300 --height=200 --list \
        --column="Option" \
        "Backup a directory or file" \
        "Exit")

    case $choice in
        "Backup a directory or file")
            path=$(zenity --title "Backup Path" --file-selection --filename="/home/$user")
            if [[ -z $path ]]; then
                break
            fi

            if [[ -d $path ]]; then
                name=$(basename $path)
                exista=$(ls $backup_dir | grep -w $name)

                if [[ -n $exista ]]; then
                    echo "1234" | sudo -S rm -r "$backup_dir/$name"
                    cp -r $path "$backup_dir/$name"
                    zenity --info --text "Directory '$name' is up to date."
                else
                    cp -r $path "$backup_dir/$name"
                    zenity --info --text "Directory '$name' added to backups."
                fi
            elif [[ -f $path ]]; then
                name=$(basename $path)
                cp $path "$backup_dir/$name"
                zenity --info --text "File '$name' added to backups."
            else
                zenity --info --text "The specified path is invalid: $path"
            fi
            ;;
        "Exit")
            break
            ;;
        *)
            zenity --error --text "Invalid option."
            ;;
    esac
done

