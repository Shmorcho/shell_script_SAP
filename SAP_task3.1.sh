#!/bin/bash

for x in $(cat variables)
do
	eval "$x"
done

for x in $(cat template_t3_tmp)
do
	eval 
done
