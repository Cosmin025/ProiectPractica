#!/bin/bash

user=$(whoami)
date=$(date)

sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /home/sys_backups/"$user($date)"

echo
echo "-------------------------------------------------------"          
echo ">>>>  System Backup Has Been Completed  <<<<"           
echo "-------------------------------------------------------"            
echo                  
