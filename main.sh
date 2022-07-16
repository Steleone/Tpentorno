text=$1
path="./ejercicios"
echo "Ingrese Opcion"
PS3='Please enter your choice: '
options=("Stats words" "Stats usage words" "Find names" 
"Stats sentences" "Blank lines counter" "Case converter" 
"Substring replace" "Block selection" "Palindrome detection" 
"One vowel words" "All upper case" "All vowels in words" 
"Mail adress detection" "Integer detection" 
"Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Stats words")
            $path/statWords.sh $text
            ;;
        "Stats usage words")
            $path/statUsageWords.sh $text
            ;;
        "Find names")
            $path/findNames.sh $text
            ;;
        "Stats sentences")
            $path/statSentences.sh $text
            ;;
        "Blank lines counter")
            $path/blankLinesCounter.sh $text
            ;;
        "Case converter")
            $path/caseConverter.sh $text
            ;;
        "Substring replace")
            $path/substringReplace.sh $text
            ;;
        "Block selection")
            $path/blockSelection.sh $text
            ;;
        "Palindrome detection")
            $path/palindromeDetection.sh $text
            ;;
        "One vowel words")
            $path/oneVowelWords.sh $text
            ;;
        "All upper case")
            $path/allUpperCase.sh $text
            ;;
        "All vowels in words")
            $path/allVowelsInWords.sh $text
            ;;
        "Mail adress detection")
            $path/mailAdressDetection.sh $text
            ;;
        "Integer detection")
            $path/integerDetection.sh $text
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done