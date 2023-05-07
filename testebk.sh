#!/bin/bash
shadow='teste:$6$5er.DHw69Q2J1cZt$XNDm/m3PajZHSV/ekp0CypaFiJF4.ErM6FdzShrYqDRdupzqsKHrvYLNkxndLRGQEknc8FtBTJ.hRmQ1APRy11:19473:0:99999:7:::'
IFS='$' read -r -a array <<< $shadow
algoritmo=SHA-512
encrypt=${array[2]}
hash=${array[3]}
IFS=':' read -r -a arrayhash <<< $hash
hash=${arrayhash[0]}

for senha in {1..9999}; do
hash2=`mkpasswd -m SHA-512 $senha $encrypt`
IFS='$' read -r -a array2 <<< $hash2hashf=${array2[3]}
if [ $hashf == $hash ]; then
	echo "senha quebrada com sucesso"
	echo "senha:" $senha
fi
done
