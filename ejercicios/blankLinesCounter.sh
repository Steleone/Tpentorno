#!/USR/BIN/ENV BASH

filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

count=0

while read line
do
  [ ${#line} -eq 0 ] && count=$(($count+1))
done < $filename

echo "Existen $count líneas en blanco en el archivo"

exit 0