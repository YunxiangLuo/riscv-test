pre=$(date +%s)
read -p "Would you like to clean the output file? [y/n] " input
if [ "$input" == 'Y' ] || [ "$input" == 'y' ]
then
    printf "" > output.txt
fi
read -p "Would you like to clean the num file? [y/n] " input
if [ "$input" == 'Y' ] || [ "$input" == 'y' ]
then
    printf "" > num
fi
if [ ! -f "index.txt" ]
then
    repoquery --qf "%{name}" | tee index.txt
fi
lines=$(cat num)
(( lines + 0 )) || cat index.txt | wc -l | tee num
lines=$(cat num)
errors=0
packages=$(tail -n $lines index.txt)
for i in $packages
do
    dnf install --assumeno $i 2> tmp
    tmp=$(cat tmp)
    if [ "$tmp" != "Operation aborted." ] && [ "$tmp" != "" ]
    then
        let errors++
        printf "$errors-TH ERROR IN PACKAGE $i : " >> output.txt
        printf "$tmp\n\n" | tee -a output.txt
    fi
    let lines--
    printf "$lines" | tee num
    echo
done
post=$(date +%s)
time=$[ $post - $pre ]
days=$[ $time / 60 / 60 / 24 ]
hours=$[ $time / 60 / 60 % 24 ]
mins=$[ $time / 60 % 60 ]
secs=$[ $time % 60 ]
printf "$lines" > num.txt
echo Elapsed Time: $days day\(s\) $hours hour\(s\) $mins minute\(s\) $secs second\(s\)