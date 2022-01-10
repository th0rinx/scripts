#!/bin/bash

echo Eliminando Usuarios Duplicados


file="delete.txt"


for c in $(cat $file); do

ldapdelete -D "cn=admin,dc=ejercito,dc=mil,dc=ar" -wredise -h 10.120.16.120 -p 389 "cn=$c,ou=Usuarios,ou=emge,dc=ejercito,dc=mil,dc=ar"

done 2> logerror.txt



echo Fin --
