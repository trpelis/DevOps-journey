#!/bin/bash

#Check if dir exists, if not, create it
if [ ! -d "/tmp/mentoring" ]; then
	mkdir /tmp/mentoring
fi

#Getting top 10 most CPU intensive processes
#Create file, then append ps command with options in that file
#Head command limits the output of the N processes, -e is used to display information about all processes
#-o specifies columns for display
echo "These are top 10 CPU intensive processes:" > /tmp/mentoring/processIntensive_list.txt
ps -eo comm,pid,%cpu --sort=-%cpu | head -n 11 >> /tmp/mentoring/processIntensive_list.txt


#Getting top 10 most memory intensive processes and appending into the file
echo "These are top 10 memory intensive processes:" >> /tmp/mentoring/processIntensive_list.txt
ps -eo comm,pid,%mem --sort=-%mem | head -n 11 >> /tmp/mentoring/processIntensive_list.txt

