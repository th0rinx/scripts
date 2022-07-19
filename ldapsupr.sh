#!/bin/bash

echo Eliminando Usuarios Duplicados


file="delete.txt"


for c in $(cat $file); do

ldapdelete -D "cn=admin,dc=company,dc=company,dc=company" -w"contraseña" -h your_ip -p 389 "cn=$c,ou=Usuarios,ou=company,dc=company,dc=company,dc=company"

done 2> logerror.txt



echo Fin --
