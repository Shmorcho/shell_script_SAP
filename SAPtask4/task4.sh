#!/bin/bash

la[1]=hope
ra[1]=hope

do_alter(){

	if [[ "$1" -le "$2" ]]
	then
		cat template_tmp | sed "s/${la[$1]}/${ra[$1]}/g" > template_t
        	cp template_t template_tmp
        	rm template_t
		do_alter $(($1+1)) $2
	fi
}

cp $1 variables_tmp
cp $2 template_tmp

cat variables_tmp | sed "s/=.*//g" > variables_t
cp variables_t variables_l
rm variables_t 

cat variables_tmp | sed "s/.*=//g" > variables_t
cp variables_t variables_r
rm variables_t

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
do_alter 1 $t
cp template_tmp template_final
rm variables_tmp template_tmp variables_r variables_l


#This is the same as task3.sh but uses recursion 
