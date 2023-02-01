#!/bin/bash

if [ ! -d "/tmp/mentoring/logs" ]; then
	mkdir "/tmp/mentoring/logs"
fi


#Creating input loop
for i in {1..4}
do
	#Get date and time at the time of writing
	date_time=$(date +"%Y-%m-%d %H:%M:%S")

	#Getting input
	echo "Write a sentence: "
	read input_sentence

	#Writing input and date/time to the file
	echo "$date_time: $input_sentence" >> /tmp/mentoring/logs/sentence.log
done


