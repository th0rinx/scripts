#!/bin/bash

echo Busqueda de usuario - filtra mailbox: - filtra columna de Usuario - 


file="dni.txt"

#REOCRRE EL .txt CON LOS DNI DE LOS USUARIOS PARA LA BUSQUEDA Y FILTRADO
for c in $(cat $file); do


ldapsearch -z 0 -H ldap://10.120.16.120:389 -wredise -D "cn=admin,dc=ejercito,dc=mil,dc=ar" -b "ou=Usuarios,ou=emge,dc=ejercito,dc=mil,dc=ar" "(carlicense=$c*)" |grep mailbox | cut -d "/" -f1 | cut -d ' ' -f 2 

done >> usuarios.txt

#FILTRA SOLO LOS NUMEROS PARES PARA ELIMINAR Y LOS DEJA EN "delete.txt"
awk 'NR%2==0' usuarios.txt > delete.txt


echo Fin --