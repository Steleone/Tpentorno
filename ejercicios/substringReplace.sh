#!/USR/BIN/ENV BASH

filename=$1
[ -d $filename ] && echo "no existe el archivo" && exit 1

cad1=$1
cad2=$2
sed -i "s/$cad1/$cad2/" $3
cat $3

exit 0