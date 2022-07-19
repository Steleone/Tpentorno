words=()
while read line
  do
    for i in $line
      do
        [[ "$i" =~ ^[A-Z]+$ ]] && words+=($i)
      done
done < $1
IFS=$'\n' sorted=($(sort <<<"${words[*]}"))
unset IFS
sorted=($(echo "${sorted[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
printf "[%s]\n" "${sorted[@]}"