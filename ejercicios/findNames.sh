name=$1
[[ "$name" =~ ^[A-Z]{1}[a-z]*$ ]] && echo "si" || echo "no"