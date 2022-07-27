filename=$1

[ -d $1 ] && echo "no existe el archivo" && exit 1

count=0

while read line
do
  [ ${#i} -eq 0 ] && count=$(($count+1))
done < $1

echo "Existen $count líneas en blanco en el archivo" 

exit 0


