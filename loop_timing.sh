#!/bin/bash

# não usar o zero na frente dos numeros dos subjects
# Aplicar as revisões previstas nos comentários quando o script chegar no subject de numero 100. ( apagar os zeros)

subjects=39 
script_dir=`pwd` 

for subject in $subjects
do

cd timing/SELF0$subject   # apagar o 0 quando chegar no subject 100


## Self 1
 
while read line
do
 echo "$line" | grep -oP "Word[0-9].RT:\s+\K\w+" >> $script_dir/Leitura1.txt
done <`ls self\ 1-$subject-*.txt`

while read line
do
 echo "$line" | grep -oP "Question.RT:\s+\K\w+" >>  $script_dir/Pergunta1.txt
done <`ls self\ 1-$subject-*.txt`

while read line
do
 echo "$line" | grep -oP "timefix:\s+\K\w+" >>  $script_dir/Timefix1.txt
done <`ls self\ 1-$subject-*.txt`

## Self 2

while read line
do
 echo "$line" | grep -oP "Word[0-9].RT:\s+\K\w+" >>  $script_dir/Leitura2.txt
done <`ls self\ 2-$subject-*.txt`

while read line
do
 echo "$line" | grep -oP "Question.RT:\s+\K\w+" >> $script_dir/Pergunta2.txt
done <`ls self\ 2-$subject-*.txt`

while read line
do
 echo "$line" | grep -oP "timefix:\s+\K\w+" >> $script_dir/Timefix2.txt
done <`ls self\ 2-$subject-*.txt`

 

###matlab -nodisplay -nodesktop -nojvm -nosplash -r "run timing_scripts_new.m"

matlab -nodisplay -nodesktop -nojvm -nosplash -r "run ../../timing_scripts_new.m"

mv ${script_dir}/*.1D .	

rm ${script_dir}/Leitura1.txt
rm ${script_dir}/Leitura2.txt
rm ${script_dir}/Pergunta1.txt
rm ${script_dir}/Pergunta2.txt
rm ${script_dir}/Timefix1.txt
rm ${script_dir}/Timefix2.txt

done



