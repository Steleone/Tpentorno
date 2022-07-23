#!/USR/BIN/ENV BASH

  filename=$1
  
  [ -d $filename ] && echo "no existe el archivo" && exit 1
  orlong=""
  orshort=""
  count=0
  totallong=0
  
  while read line  
  do
    IFS='.' read -ra ADDR <<< "$line"
    for i in "${ADDR[@]}"; do
      [ ${#i} -gt ${#orlong} ] && orlong=$i
      [ ${#i} -lt ${#orshort} ] || [ ${#orshort} -eq 0  ] && orshort=$i
      count=$(($count+1))
      totallong=$(($totallong+${#i}))
    done
  done < $filename
  
  echo "Oracion Larga: $orlong   longitud: ${#orlong}"
  echo "Oracion Corta: $orshort   longitud: ${#orshort}"
  echo "Total Oraciones: $count   Total longitud: $totallong   Promedio: $(($totallong/count))"
  exit 0