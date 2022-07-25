#!/USR/BIN/ENV BASH

filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

list=()
while read line
  do
    for j in $line
      do
        input=$j
        len=${#input}
        reverse=""
        for (( i=$len-1; i>=0; i-- ))
        do 
        	reverse="$reverse${input:$i:1}"
        done
        [ $input == $reverse ] &&  list+=($input)
      done
done < $1
printf "[%s]\n" "${list[@]}"
exit 0