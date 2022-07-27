filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

words=()
while read line
  do
    for i in $line
      do
        vars=()
        check=0
        cA=$(echo $i | grep -o -i "[aA]" | wc -l)
        [ $cA -ge 1 ] && check=$(($check+1)) && vars+=("a")
        cE=$(echo $i | grep -o -i "[eE]" | wc -l)
        [ $cE -ge 1 ] && check=$(($check+1)) && vars+=("e")
        cI=$(echo $i | grep -o -i "[iI]" | wc -l)
        [ $cI -ge 1 ] && check=$(($check+1)) && vars+=("i")
        cO=$(echo $i | grep -o -i "[oO]" | wc -l)
        [ $cO -ge 1 ] && check=$(($check+1)) && vars+=("o")
        cU=$(echo $i | grep -o -i "[uU]" | wc -l)
        [ $cU -ge 1 ] && check=$(($check+1)) && vars+=("u")
        [ $check -eq 5 ] && words+=($i)
      done
done < $1
IFS=$'\n' sorted=($(sort <<<"${words[*]}" | uniq -c | sort -n ))
unset IFS
if [ ${#words} -eq 0 ]
then
  echo "No hay palabras que contengan todas las vocales"
else
  printf "[%s]\n" "${sorted[@]}"
fi