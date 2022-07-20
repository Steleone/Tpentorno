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
printf "[%s]\n" "${sorted[@]}"