#!/bin/bash

#Definicion de colores
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#echo "${red}red text ${green}green text${reset}"
for i in 1 2 3 4
do
   echo "${red}Welcome ${green}$i${reset} times"
	sleep 10
done
