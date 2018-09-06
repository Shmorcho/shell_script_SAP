#!/bin/bash

if [ -e template ]
then
	cp template template_tmp
	for R in $PARAM1 $PARAM2 $PARAM3 $PARAM4 $PARAM5 $PARAM6 $PARAM7 $PARAM8 $PARAM9
	do 	
		sed -n "s/@PARAM[1-9]@/$R/p" template_tmp > template_temp
		cp template_temp template_tmp
	done
	cp template_tmp template_final
	rm template_tmp
  	
	  
else
	echo "No pattern found!"
fi
