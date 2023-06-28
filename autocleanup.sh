#!/bin/bash

echo
echo "--------------------------------------------"
echo ">>>>>> Cleaning up The Operating System <<<<<<"
echo "--------------------------------------------"           
echo                     


echo "1234"|sudo rm -r ~/git/temporary/* 2> /dev/null
echo "1234"|sudo rm -r ~/.cache/* 2> /dev/null
echo "1234"|sudo rm -r ~/tmp/* 2> /dev/null

echo
echo "-------------------------------------------------------"          
echo ">>>>   Operating System Cleanup Has Been Completed  <<<<"           
echo "-------------------------------------------------------"            
echo           
exit             


