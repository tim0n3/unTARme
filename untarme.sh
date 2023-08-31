#!/bin/bash

# Define the log file
LOG_FILE="/home/pi/untar.log"
VERBOSE=false

# Function to log messages
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Function to log and print messages if verbose mode is enabled
log_or_print() {
    message="$1"
    log "$message"
    if [ "$VERBOSE" = true ]; then
        echo "$message"
    fi
}

# Parse command line options
while getopts ":v" opt; do
  case $opt in
    v)
      VERBOSE=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift the options so that $1 now refers to the directory argument
shift "$((OPTIND-1))"

# Define the directory (use "$1" or a default directory if not provided)
directory="${1:-/path/to/your/directory}"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  log_or_print "Directory does not exist: $directory"
  exit 1
fi

# Use find to locate .tar.gz files and process them one by one
find "$directory" -type f -name "*.tar.gz" -print0 | while IFS= read -r -d '' file; do
  # Log and print the file extraction
  log_or_print "Extracting $file"
  
  # Extract the file using tar with the specified options
  tar -xvf "$file" --strip-components 3 >> "$LOG_FILE" 2>&1
  
  # Check if the extraction was successful
  if [ $? -eq 0 ]; then
    log_or_print "Extraction of $file completed successfully"
  else
    log_or_print "Extraction of $file failed"
  fi
done

log_or_print "Extraction completed."
