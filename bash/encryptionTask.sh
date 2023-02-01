#!/bin/bash


encryption(){
	
	read -p "Enter file or dir path to encrypt: " file_path
	read -p "Enter location to save encrypted path: " save_path
	read -p "Enter passphrase for encryption: " passphrase

	date=$(date +%Y-%m-%d)
	username=$(whoami)
	extension=".enc"

	filename=$(basename "$file_path")
	encrypted_filename="$date-$username-$filename$extension"

	gpg --output "$save_path/$encrypted_filename" --symmetric --cipher-algo AES256 "$file_path" 

}

decryption(){
	
	read -p "Enter location of encrypted file: " encrypted_file
	read -p "Enter decryption passphrase: " decryption_file
	read -p "Enter location to save decrypted file: " decrypted_save_path
	
	gpg --output "$decrypted_save_path" --decrypt "$encrypted_file"
}

case "$1" in
	"encrypt")
	       	encryption
	 ;;
	"decrypt")
	       	decryption
	 ;;
	 *)
	       	echo "Invalid option. Options available are encrypt and decrypt." 
esac

