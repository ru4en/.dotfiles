#!/bin/bash

# Function to print usage information
print_usage() {
    echo "Usage: $0 <directory_path> [--flipped]"
}

# Check if the number of arguments is correct
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    print_usage
    exit 1
fi

# Get the directory path from the command-line argument
directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory not found - $directory"
    print_usage
    exit 1
fi

# Check if the --flipped flag is provided
flipped=false
if [ "$#" -eq 2 ] && [ "$2" == "--flipped" ]; then
    flipped=true
fi

# Define color replacements
#	bottom bodder					logo		mid		top
colors=("62a0ea:007A45" "afd4ff:00CC74" "c0d5ea:00CC74" "3f8ae5:5CFFB8" "a4caee:00B466" "438de6:046252")

# Flip the colors if the --flipped flag is provided
if [ "$flipped" == true ]; then
    for i in "${!colors[@]}"; do
        old_color="${colors[$i]%%:*}"
        new_color="${colors[$i]#*:}"
        colors[$i]="$new_color:$old_color"
    done
fi

# Loop through each SVG file in the directory
for file in "$directory"/*.svg; do
    # Check if the file exists
    if [ -e "$file" ]; then
        # Loop through each color replacement
        for color in "${colors[@]}"; do
            # Split color into old and new values
            old_color="${color%%:*}"
            new_color="${color#*:}"

            # Replace old color with new color in the SVG file
            sed -i "s/$old_color/$new_color/g" "$file"
        done

        echo "Colors replaced in file: $file"
    else
        echo "File not found: $file"
    fi
done

echo "Color replacement process completed."

