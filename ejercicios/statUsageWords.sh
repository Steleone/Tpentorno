#!/USR/BIN/ENV BASH

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
for value in "${sorted[@]}"
do
  echo $value
done