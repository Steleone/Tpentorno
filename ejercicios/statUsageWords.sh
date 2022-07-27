filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1
list=()
while read line
do
  for i in $line
  do
    [ ${#i} -ge 4 ] && list+=($i)
  done
done < $filename
IFS=$'\n' sorted=($(sort <<<"${list[*]}" | uniq -c | sort -n )); unset IFS

min=0
max=$(( ${#sorted[@]} -1 ))

while [[ min -lt max ]]
do
    x="${sorted[$min]}"
    sorted[$min]="${sorted[$max]}"
    sorted[$max]="$x"
    (( min++, max-- ))
done
count=0
for value in "${sorted[@]}"
do
  [ $count -lt 10 ] && echo $value && count=$(($count+1))
done
exit 0