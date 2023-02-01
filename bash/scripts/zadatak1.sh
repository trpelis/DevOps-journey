#!/bin/bash

#Checking existence of the dir, if it doesn't exist, creates it
# Check existence of directory /tmp/mentoring
if [ ! -d "/tmp/mentoring" ]; then
  mkdir /tmp/mentoring
fi

# Check existence of directory /tmp/mentoring/backup
if [ ! -d "/tmp/mentoring/backup" ]; then
  mkdir /tmp/mentoring/backup
fi

# Check existence of directory /tmp/mentoring/logs
if [ ! -d "/tmp/mentoring/logs" ]; then
  mkdir /tmp/mentoring/logs
fi

# Check existence of directory /tmp/monitoring/subdirectories
if [ ! -d "/tmp/mentoring/subdirectories" ]; then
  mkdir /tmp/mentoring/subdirectories
fi

# Generates 10 randomly named directories using shuf command
for i in {1..10}; do
  dir_name=$(shuf -n1 /usr/share/dict/words)
  mkdir /tmp/mentoring/subdirectories/$dir_name
done
