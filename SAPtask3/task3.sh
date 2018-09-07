#!/bin/bash

cp $1 variables_tmp
cp $2 template_tmp

cat variables_tmp | sed "s/=.*//g" > variables_t
cp variables_t variables_l
rm variables_t 

cat variables_tmp | sed "s/.*=//g" > variables_t
cp variables_t variables_r
rm variables_t

ra[0]="noinf"
la[0]="noinf"
t=1
h=1

for x in $(cat variables_l)
do
	la[$t]=$x
	t=$(($t+1))
done
 
for x in $(cat variables_r)
do
	ra[$h]=$x
	h=$(($h+1))
done

t=$(($t-1))
for x in $(seq 1 $t)
do
	cat template_tmp | sed "s/@${la[$x]}@/${ra[$x]}/g" > template_t
	cp template_t template_tmp
	rm template_t	
done
cp template_tmp template_final
rm variables_tmp template_tmp variables_r variables_l


#This is the most important line of all! 
