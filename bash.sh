#!/bin/bash
#gnome-terminal
computer=$(cat /etc/hostname)

while true 
do

caminho=$(pwd | sed "s/\/home\/$USER/~/" )
echo -n $USER@$computer:$caminho"$ "; read comando
echo $comando
help | grep -qw $comando

if [ $? -eq 0 ]; then
	/usr/bin/time -f "$comando %e, %U, %S" -ao comandos echo $comando | bash
else
	echo $comando | bash
fi
 
echo "Meu terminal" 
done 

cd /home/fulando grep