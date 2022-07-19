#!/bin/bash

echo Busqueda de usuario - filtra mailbox: - filtra columna de Usuario - 


file="dni.txt"

#REOCRRE EL .txt CON LOS DNI DE LOS USUARIOS PARA LA BUSQUEDA Y FILTRADO
for c in $(cat $file); do


ldapsearch -z 0 -H ldap://Your_Ip:389 -w"contraseña" -D "cn=admin,dc=dominio,dc=dominio,dc=dominio" -b "ou=Usuarios,ou=lugar,dc=lugar,dc=lugar,dc=lugar" "(carlicense=$c*)" |grep mailbox | cut -d "/" -f1 | cut -d ' ' -f 2 

done >> usuarios.txt

#FILTRA SOLO LOS NUMEROS PARES PARA ELIMINAR Y LOS DEJA EN "delete.txt"
awk 'NR%2==0' usuarios.txt > delete.txt


echo Fin --
