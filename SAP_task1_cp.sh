#!/bin/bash

if [ -e template ]
then

	for R in $PARAM1 $PARAM2 $PARAM3
	do 	
		sed -n "s/@PARAM[1-9]@/$R/p" template_tmp > template_temp
		cp template_temp template_tmp
	done
  	
	  
else
	echo "No pattern found!"
fi
