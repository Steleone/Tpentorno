filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

echo "Cadena a remplazar"
read cad1
echo "Cadena por la que se remplaza"
read cad2
sed -i "s/$cad1/$cad2/g" $1
cat $1

exit 0