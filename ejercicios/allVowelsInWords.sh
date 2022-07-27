filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

words=()
while read line
  do
    for i in $line
      do
        vars=()
        check=0
        cA=$(echo $i | grep -o -i "[aA]" | wc --lines)
        [ $cA -ge 1 ] && check=$(($check+1)) && vars+=("a")
        cE=$(echo $i | grep -o -i "[eE]" | wc --lines)
        [ $cE -ge 1 ] && check=$(($check+1)) && vars+=("e")
        cI=$(echo $i | grep -o -i "[iI]" | wc --lines)
        [ $cI -ge 1 ] && check=$(($check+1)) && vars+=("i")
        cO=$(echo $i | grep -o -i "[oO]" | wc --lines)
        [ $cO -ge 1 ] && check=$(($check+1)) && vars+=("o")
        cU=$(echo $i | grep -o -i "[uU]" | wc --lines)
        [ $cU -ge 1 ] && check=$(($check+1)) && vars+=("u")
        [ $check -eq 5 ] && words+=($i)
      done
done < $1
IFS=$'\n' sorted=($(sort <<<"${words[*]}"))
unset IFS
printf "[%s]\n" "${sorted[@]}" 
#falta contar repeticiones