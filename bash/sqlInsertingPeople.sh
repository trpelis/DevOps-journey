#!/bin/bash


insert_mentor() {

	echo "You are creating mentor."
	read -p "Enter name: " mentor_name
	read -p "Enter last name: " mentor_lName
	read -p "Enter age: " mentor_age
	read -p "Enter city: " mentor_city
	read -p "Enter username: " mentor_username
	read -p "Enter password: " mentor_password
	read -p "Enter favourite movie: " mentor_favMovie

	mysql -u root -p mentorship -e "INSERT INTO mentor (name, last_name, age, city, username, password, favourite_movie) VALUES ('$mentor_name', '$mentor_lName', '$mentor_age', '$mentor_city', '$mentor_username', '$mentor_password', '$mentor_favMovie');"
	
}

insert_student(){
	
	echo "You are creating student."
	read -p "Enter name: " student_name
	read -p "Enter last name: " student_lName
	read -p "Enter age: " student_age
	read -p "Enter city: " student_city
	read -p "Enter username: " student_username
	read -p "Enter password: " student_password
	read -p "Enter favourite movie: " student_favMovie

	mysql -u root -p mentorship -e "INSERT INTO student (name, last_name, age, city, username, password, favourite_movie) VALUES ('$student_name', '$student_lName', '$student_age', '$student_city', '$student_username', '$student_password', '$student_favMovie');"
}

main() {

	if [ "$1" == "mentor" ]; then
		insert_mentor
	elif [ "$1" == "student" ]; then
		insert_student
	else
		echo "Invalid option"
	fi
}

main "$1"
