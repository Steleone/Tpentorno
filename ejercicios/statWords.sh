#!/USR/BIN/ENV BASH

filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

pallong=""
palshort=""
count=0
totallong=0

while read line
do
    for i in $line
    do
    [ ${#pallong} -lt ${#i} ] && pallong=$i
    [ -z $palshort ] && palshort=$i
    [ ${#palshort} -gt ${#i} ] && palshort=$i
    count=$(($count+1))
    totallong=$(($totallong+${#i}))
    done
done < $filename

echo "Palabra Larga: $pallong   longitud: ${#pallong}"
echo "Palabra Corta: $palshort   longitud: ${#palshort}"
echo "Total Palabras: $count   Total longitud: $totallong   Promedio: $(($totallong/count))"
exit 0