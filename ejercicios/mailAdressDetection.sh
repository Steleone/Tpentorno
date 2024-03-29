filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

mails=()
while read line
  do
    for i in $line
      do
        [[ "$i" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]] && mails+=($i)
      done
done < $1
IFS=$'\n' sorted=($(sort <<<"${mails[*]}"))
unset IFS
sorted=($(echo "${sorted[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
if [ ${#sorted} -eq 0 ]
then
  echo "No hay direcciones de mail en el archivo"
else
  printf "[%s]\n" "${sorted[@]}"
fi