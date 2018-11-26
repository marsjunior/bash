#!/bin/bash
computer=$(cat /etc/hostname)
home=$(echo "/home/$USER")
comando_shell=-1
while true;do

caminho=$(pwd | sed "s/\/home\/$USER/~/" )
echo -n $USER@$computer:$caminho"$ "; read comando

vazio=$(echo $comando | awk '{print $1}')
argumentos=$(echo $comando | sed -e 's/ /\n/g')

if [ -n "$vazio" ]; then

	for x in $argumentos; do
	x=$(echo $x | sed -e 's/-//g')
	x=$(echo $x | sed -e 's/|//g')
	tamanho=${#x}
	if [ $tamanho -ge 2 ];then
		help | grep -qw $x
		comando_shell=$?
		if [ "$x" = 'cd' ]; then
			comando_shell=2
			break
		elif [ $comando_shell -eq 0 ]; then
			break
		fi
	fi	

	done 

	 if [ $comando_shell -eq 1 ]; then
	 	/usr/bin/time -f "$comando %e, %U, %S" -ao "$home/.log_bash" echo $comando | bash
	 elif [ $comando_shell -eq 2 ]; then
	 	$comando
	 elif [ $comando_shell -eq 0 ];then
	 	echo $comando_shell | bash
	 fi
fi

done 
