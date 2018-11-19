#!/bin/bash
#gnome-terminal
computer=$(cat /etc/hostname)

while true 
do

caminho=$(pwd | sed "s/\/home\/$USER/~/" )
echo -n $USER@$computer:$caminho"$ "; read comando
echo $comando
#/usr/bin/time -f "$comando %e, %U, %S" -ao comandos $comando 
$comando
echo "Meu terminal" 
done 

