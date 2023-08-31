#!/bin/bash

# Define the directory you want to search for .tar.gz files
directory="/home/pi/backups"

# Define the log file
LOG_FILE="/home/pi/backups/untar.log"

# Function to log messages
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Check if the directory exists
if [ ! -d "$directory" ]; then
  log "Directory does not exist: $directory"
  exit 1
fi

# Loop through the directory and extract .tar.gz files
for file in "$directory"/*.tar.gz; do
  if [ -f "$file" ]; then
    # Log the file extraction
    log "Extracting $file"
    
    # Extract the file using tar with the specified options
    tar -xvf "$file" --strip-components 3 >> "$LOG_FILE" 2>&1
    
    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
      log "Extraction of $file completed successfully"
    else
      log "Extraction of $file failed"
    fi
  fi
done

log "Extraction completed."