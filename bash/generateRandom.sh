#!/bin/bash

pip install faker

generate_first_name() {
  faker first_name
}

generate_last_name() {
  faker last_name
}

generate_city() {
  faker city
}

generate_age(){
	echo $(( ( RANDOM % 50 ) + 20))
}

generate_username() {
  local username="$1$2$3"
  echo "${username// /}"
}


generate_password() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*()_+' | fold -w 8 | head -n 1
}


generate_movie() {
  movies=( "The Godfather" "The Shawshank Redemption" "The Dark Knight" "Pulp Fiction" "The Lord of the Rings: The Return of the King" "The Good, the Bad and the Ugly" "12 Angry Men" "Schindler's List" "The Lord of the Rings: The Fellowship of the Ring" "Forrest Gump" "Inception" "The Matrix" "Goodfellas" "The Silence of the Lambs" "It's a Wonderful Life" "The Lion King" "Star Wars: Episode V - The Empire Strikes Back" "The Terminator" "Raiders of the Lost Ark" "Back to the Future" "E.T. the Extra-Terrestrial" "Ghostbusters" "Jurassic Park" "Indiana Jones and the Last Crusade" "Groundhog Day" "The Matrix Reloaded" "The Matrix Revolutions" "Pirates of the Caribbean: The Curse of the Black Pearl" "Pirates of the Caribbean: Dead Man's Chest" "Pirates of the Caribbean: At World's End" )
  echo ${movies[$RANDOM % ${#movies[@]} ]}
}


if [ "$1" == "mentor" ]; then
  table_name="mentor"
elif [ "$1" == "student" ]; then
  table_name="student"
else
  echo "Usage: $0 [mentor|student]"
  exit 1
fi

for i in {1..20}
do
  first_name=$(generate_first_name)
  last_name=$(generate_last_name)
  city=$(generate_city)
  age=$(generate_age)
  username=$(generate_username $first_name $last_name $i)
  password=$(generate_password)
  movie=$(generate_movie)


  mysql -u root -p mentorship -e "INSERT INTO $table_name (name, last_name, age, city, username, password, favourite_movie) VALUES ('$first_name', '$last_name', '$age', '$city', '$username', '$password', '$movie');"
done

