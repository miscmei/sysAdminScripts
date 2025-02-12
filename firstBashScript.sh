#!/bin/bash
# This script reads a large file, takes the last 20 lines of the file and removes every occurrence of the letter E from the lines. 
# The lines are then added to a new file to view. 



# BEGIN for checking if the file exists

source_file="DemoFile.txt"
new_file="20lines.txt"


if [ ! -f "$source_file" ]; then
    echo "Error: File '$source_file' not found"
    exit 1
fi

echo "Making a new file called $new_file"
touch $new_file

echo ""
echo "The first 20 lines are: "
head -20 $source_file

echo ""
echo "Adding these first 20 lines to $new_file"

head -20 "$source_file" > "$new_file"

echo ""
echo "Now I will remove every occurence of the letter E from every line"
edited_file="noEfile.txt"

echo "Making a new file called $edited_file"
touch $edited_file


tester="tester.txt"
echo ""
echo "I will use grep to find every line with the letter E in $new_file"
grep -i 'e' $new_file

echo ""
echo "and I will use sed to remove every occurence of the letter E"
grep -i 'e' "$new_file" | sed 's/[eE]//g' > $edited_file


echo ""
echo "The edited lines have been added to $edited_file , the lines are:"
tail $edited_file
