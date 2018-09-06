#!/bin/bash

cp template_t3_tmp template_t3_temp

for x in $(cat variables)
do 
	eval "$x"
done
cp variables variables_tmp
cp variables variables_tmp2

t=1
arr[0]="tst"

cat variables_tmp2 | sed "s/.*=//g" > variables_tmp22
cp variables_tmp22 variables_tmp2
rm variables_tmp22

cat variables_tmp | sed "s/=.*//g" > variables_tmp1
cp variables_tmp1 variables_tmp
rm variables_tmp1

cat variables_tmp2

for x in $(cat variables_tmp2)
do
	
	arr[$t]=$x
	t=$(($t+1))			
done

vr[0]="unk"
h=1

for x in $(cat variables_tmp)
do
	vr[$h]=$x
	h=$(($h+1))	
done


t=$(($t-1))
for x in $(seq 1 $t)
do
	cat template_t3_temp | sed "s/${vr[$x]}/${arr[$x]}/g" > template_t3_temp2
	cp template_t3_temp2 template_t3_temp
	
done

cp template_t3_temp template_final
rm variables_tmp2 variables_tmp
