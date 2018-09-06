#!/bin/bash

if [ -e template_t2 ]
then
	cp template_t2 template_t2_tmp
	for R in $PARAM1 $PARAM2 $PARAM3 $PARAM4 $PARAM5 $PARAM6 $PARAM7 $PARAM8 $PARAM9
	do 	
		sed -n "s/@[A-Za-z1-9]*@/$R/p" template_t2_tmp > template_t2_temp
		cp template_t2_temp template_t2_tmp
	done
	cp template_t2_tmp template_t2_final
	rm template_t2_temp template_t2_tmp
	  
else
	echo "No pattern found!"
fi
