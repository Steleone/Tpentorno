nums=()
while read line
  do
    for i in $line
      do
        [[ "$i" =~ ^[0-9]+$ ]] && nums+=($i)
      done
done < $1
# TODO falta contar numero de apariciones
printf "%s\n" "${nums[@]}" | sort -n