#!/bin/bash

# Define the directory you want to search for .tar.gz files
directory="/home/pi/tarfiles"

# Define the log file
log_file="/home/pi/untar.log"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "$(date +"%Y-%m-%d %T"): Directory does not exist: $directory" >> "$log_file"
  exit 1
fi

# Loop through the directory and extract .tar.gz files
for file in "$directory"/*.tar.gz; do
  if [ -f "$file" ]; then
    # Log the file extraction
    echo "$(date +"%Y-%m-%d %T"): Extracting $file" >> "$log_file"
    
    # Extract the file using tar with the specified options
    tar -xvf "$file" --strip-components 3 >> "$log_file" 2>&1
    
    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
      echo "$(date +"%Y-%m-%d %T"): Extraction of $file completed successfully" >> "$log_file"
    else
      echo "$(date +"%Y-%m-%d %T"): Extraction of $file failed" >> "$log_file"
    fi
  fi
done

echo "$(date +"%Y-%m-%d %T"): Extraction completed." >> "$log_file"