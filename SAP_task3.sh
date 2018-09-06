#!/bin/bash

export_values(){

	for x in $(cat template_t3)
	do
		TX = $x | grep /.+?(
		export $x | grep 
	done
}


if [ -e template_t3 ]
then

	export_values()
	
	for R in $PARAM1 $PARAM2 $PARAM3 $PARAM4 $PARAM5 $PARAM6 $PARAM7 $PARAM8 $PARAM9
	do 	
		sed -n "s/@[A-Za-z1-9]*@/$R/p" template_t3_tmp > template_t3_temp
		cp template_t3_temp template_t3_tmp
	done
	rm template_t3_temp	  	
	  
else
	echo "No pattern found!"
fi
