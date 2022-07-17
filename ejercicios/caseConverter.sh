#! /bin/bash

[ -d $1 ] && echo "no existe el archivo" && exit 1

while read line
do
  for word in $line
  do
    for i in $(seq 0 ${#word})
    do
      l=${word:i:1}
      upperl=${l^}
      lowerl=${l,}
      if [ $l = $upperl ]
      then
        echo "$lowerl" 
      else
        echo "$upperl" 
      fi
    done
  done
done < $1

exit 0
#Falta hacer que devuelva parrafos completos, no letra por letra.
#¿Cómo voy agregando las letras a un archivo que respete eso?
#Trabajar línea por línea, en el primer "do"