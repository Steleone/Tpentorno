filename=$1

[ -d $filename ] && echo "no existe el archivo" && exit 1

list=()

while read line
do
    for i in $line
    do
    name=$i
    [[ "$name" =~ ^[A-Z]{1}[a-z]*$ ]] && list+=($name) 
    done
done < $filename

printf "%s\n" "${list[@]}"

exit 0