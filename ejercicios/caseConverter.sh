filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

text=""
for word in $(<$1)
do
  wordu="${word^^}"
  wordl="${word,,}"
  wordt=""
  for i in $(seq 0 ${#word})
  do
    if [ ! -z "${word:$i:1}" -a "${word:$i:1}" != " " ] && [[ "${word:$i:1}" =~ ^[a-zA-Z]+$ ]]; then
      [ ${word:$i:1} == ${wordu:$i:1} ] && wordt="$wordt${wordl:$i:1}"
      [ ${word:$i:1} == ${wordl:$i:1} ] && wordt="$wordt${wordu:$i:1}"
    else
      wordt="$wordt${word:$i:1}"
    fi
  done
  text="$text $wordt"
done
echo "$text" 