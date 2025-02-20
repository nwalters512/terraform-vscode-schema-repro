#!/bin/bash

# Base directory to create the random tree
BASE_DIR="./random_tree"
NUM_FILES=1000
FILE_SIZE=102400  # 100KB in bytes

# Remove the existing directory
rm -rf "$BASE_DIR"

# Create base directory
mkdir -p "$BASE_DIR"

# Function to generate a random subdirectory path
random_subdir() {
    local depth=$(( RANDOM % 4 + 1 )) # Random depth between 1 and 4
    local path="$BASE_DIR"
    for ((i=0; i<depth; i++)); do
        path+="/dir_$(( RANDOM % 10 ))"
    done
    echo "$path"
}

# Generate files in random directories
for ((i=1; i<=NUM_FILES; i++)); do
    DIR_PATH=$(random_subdir)
    mkdir -p "$DIR_PATH"
    FILE_PATH="$DIR_PATH/file_$i.dat"
    
    # Generate a 100KB file with random content
    head -c "$FILE_SIZE" /dev/urandom > "$FILE_PATH"
done

echo "Random directory tree created at: $BASE_DIR"
