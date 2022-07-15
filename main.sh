#!/usr/bin/env bash

toutext=$1
echo "Ingrese Opcion"
PS3='Please enter your choice: '
options=("StatWords" "StatsUsageWords" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "StatWords")
            . tp1.sh $text
            ;;
        "StatsUsageWords")
            . tp2.sh $text
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done