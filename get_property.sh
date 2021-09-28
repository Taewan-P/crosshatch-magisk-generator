#!/bin/bash

# Ubuntu does not have command `getprop`. Only android does.
# This function is a simple implementation of getprop command, but
# gets value from GETPROP_OUTPUT file. <- You should copy/paste it from your phone.
# However is not fully implemented. Only shows property values when argument exists. 

getprop() {
	if [ -f GETPROP_OUTPUT ]; then
		local prop_output=`cat GETPROP_OUTPUT`
		if [ $# -eq 0 ]; then
			# No specific property. Return whole getprop
			echo "$prop_output"
		else
			local key="$1"
			local key_value=`grep $key GETPROP_OUTPUT`
			# IFS does not work in zsh!
			IFS=':'
			value=($key_value)
			unset IFS
			local result=${value[1]}
			echo $result | sed 's/[][]//g'
		fi
	fi
}

export -f getprop