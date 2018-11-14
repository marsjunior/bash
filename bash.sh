#!/bin/bash
#gnome-terminal
computer=$(cat /etc/hostname)
caminho=$(pwd | sed "s/\/home\/$USER/~/" )

while true 
do

echo -n $USER@$computer:$caminho"$ "; read comando
echo $($comando)
echo "Meu terminal" 
done 