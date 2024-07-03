#!/bin/bash

LOG_FILE="/home/pi/untar.log"
VERBOSE=false

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log_or_print() {
    message="$1"
    log "$message"
    if [ "$VERBOSE" = true ]; then
        echo "$message"
    fi
}

extract_file() {
    file="$1"
    log_or_print "Extracting $file"
    tar -xvf "$file" --strip-components 3 >> "$LOG_FILE" 2>&1
    if [ $? -eq 0 ]; then
        log_or_print "Extraction of $file completed successfully"
    else
        log_or_print "Extraction of $file failed"
    fi
}

main() {
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

    shift "$((OPTIND-1))"

    directory="${1:-/path/to/your/directory}"

    if [ ! -d "$directory" ]; then
      log_or_print "Directory does not exist: $directory"
      exit 1
    fi

    find "$directory" -type f -name "*.tar.gz" -print0 | parallel -0 -j 4 --will-cite extract_file

    log_or_print "Extraction completed."
}

main "$@"

