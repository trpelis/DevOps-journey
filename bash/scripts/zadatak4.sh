#!/bin/bash


#sudo dnf install wamerican | running fedora, wamerican not available for fedora, preinstalled /usr/share/dict/words

cp /usr/share/dict/words /tmp/mentoring

echo "Please, enter a term for search: "
read input_string

grep $input_string /tmp/mentoring/words

