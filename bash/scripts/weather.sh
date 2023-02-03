#!/bin/bash 


if [ $# -eq 0 ]; then
	echo "Usage: weather.sh <city_name"
	exit 1
fi

city=$1
curl wttr.in/$city
