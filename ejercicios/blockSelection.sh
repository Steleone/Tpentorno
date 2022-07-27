filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

echo "Ingrese tipo(O/P)"
read tipo
echo "Ingrese numero de entrada"
read numero

[ $tipo != "O" ] && [ $tipo != "P" ] && echo "Tipo incorrecto" && exit 1
count=0
if [ $tipo != "O" ]
then
  while read line
  do
    [ $count -eq $numero ] && echo $line && exit 0
    count=$(($count+1))
  done < $1
elif [ $tipo != "P" ]
then
  while read line  
  do
    IFS='.' read -ra ADDR <<< "$line"
    for i in "${ADDR[@]}"; do
      [ $count -eq $numero ] && echo $i && exit 0
      count=$(($count+1))
    done
  done < $1
fi

exit 0