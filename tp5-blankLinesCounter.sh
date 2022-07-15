count=0
filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

while read line
do
  [ ${#i} -eq 0 ] && count=$(($count+1))
done < filename

echo "Existen $count líneas en blanco en el archivo"