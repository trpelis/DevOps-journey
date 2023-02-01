#!/bin/bash


#Defining the directories that we work with
#source_dir is the dir we are archiving, backup_dir is where we'll save it
source_dir="/tmp/mentoring/subdirectories"
backup_dir="/tmp/mentoring/backup"

#First, check if dir exists, if not, create it
if [ ! -d "/tmp/mentoring/backup" ]; then
	mkdir $backup_dir
fi


#Get current date
date=$(date +"%d-%m-%Y")

#Create archive
tar -zcvf $backup_dir/subdirectories_$date.tar.gz $source_dir

