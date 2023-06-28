#!/bin/bash

user=$(whoami)
gitdir="/home/$user/git/ProiectPractica"

if [[ -d $gitdir ]]
then

echo "1234"|sudo -S rm -r $gitdir

fi

cd /home/$user/git
git clone https://github.com/Cosmin025/ProiectPractica.git
#echo
#echo "-----------------------------------"
#echo ">>>>> Actualizare configurari <<<<<"
#echo "-----------------------------------"
#echo

rsync -av ~/git/ProiectPractica/.config ~/.config 
cp -v "$gitdir/.bashrc" "$HOME/.bashrc" 2> /dev/null
