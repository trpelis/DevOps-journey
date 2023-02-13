#!/bin/bash

# Function to generate random first name
generate_first_name() {
  cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 8 | head -n 1
}

# Function to generate random last name
generate_last_name() {
  cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 8 | head -n 1
}

# Function to generate random age
generate_age() {
  echo $(( ( RANDOM % 50 )  + 20 ))
}

# Function to generate random city
generate_city() {
  cities=( "New York" "London" "Paris" "Berlin" "Rome" "Madrid" "Amsterdam" "Moscow" "Beijing" "Tokyo" "Sydney" "Toronto" "Seoul" "Mexico City" "Buenos Aires" "Rio de Janeiro" )
  echo ${cities[$RANDOM % ${#cities[@]} ]}
}

# Function to generate random username
generate_username() {
  echo "$1$2$3"
}

# Function to generate random password
generate_password() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1
}

# Function to generate random favorite movie
generate_movie() {
  movies=( "The Godfather" "The Shawshank Redemption" "The Dark Knight" "Pulp Fiction" "The Lord of the Rings: The Return of the King" "The Good, the Bad and the Ugly" "12 Angry Men" "Schindler's List" "The Lord of the Rings: The Fellowship of the Ring" " Forrest Gump" "Inception" "The Matrix" "Goodfellas" "The Silence of the Lambs" "It's a Wonderful Life" )
  echo ${movies[$RANDOM % ${#movies[@]} ]}
}

# Generate 15 random person records
for i in {1..15}
do
  first_name=$(generate_first_name)
  last_name=$(generate_last_name)
  age=$(generate_age)
  city=$(generate_city)
  username=$(generate_username $first_name $last_name $age)
  password=$(generate_password)
  movie=$(generate_movie)

  # Insert the record into the "student" table
  mysql -u root  -p  mentorship  -e "INSERT INTO student (name, last_name, age, city, username, password, favourite_movie) VALUES ('$first_name', '$last_name', '$age', '$city', '$username', '$password', '$movie');"
done
