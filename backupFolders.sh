#!/bin/bash
# this script backs up a folder using tar and gzip

echo ""
echo "----------Welcome to the Backup Folders Page----------"
echo ""

# -p prompts the user with a message, also prevents the script from infinitely printing the options
read -p "Enter the folder you want to back up: " folder_to_backup


# check if folder exists first
if [ ! -d "$folder_to_backup" ]; then
    echo "Error: The folder '$folder_to_backup' does not exist."
    exit 1
fi

# Now safely resolve it to an absolute path
folder_to_backup=$(realpath "$folder_to_backup")

read -p "Where do you want to place this backup? (it can be a folder that doesn't yet exist) " backup_dir

# create destination directory if it doesn't exist
# -d checks if backup_dir is a directory
if [ ! -d "$backup_dir" ]; then
    echo "The directory you entered doesn't exist. Creating it now..."
    mkdir "$backup_dir" || { echo "Failed to create directory. Exiting."; exit 1; }
fi

# the default name makes a folder with the current date and time rather than a custom one from the user
default_name="backup_$(basename "$folder_to_backup")_$(date +%F_%H-%M-%S).tar.gz"

read -p "Enter a name for the backuped up folder [default: $default_name]: " backup_name
backup_name=${backup_name:-$default_name}

# backing up the folder with tar
# c for create, v for verbose, z for compressing with gzip, and f for filename
echo "Creating the backuped up folder..."
tar cvzf "$backup_dir/$backup_name" -C "$(dirname "$folder_to_backup")" "$(basename "$folder_to_backup")" || {
    echo "Backup failed."
    exit 1
}


echo "The folder was backed up successfully!"
echo "Backup file: $backup_dir/$backup_name"
echo ""