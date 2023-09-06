# Tar Extractor Script

This Bash script is designed to extract `.tar.gz` files from a specified directory. It provides an option to enable verbose mode for detailed logging. 

## Usage

You can use this script as follows:

```bash
./untarme.sh [OPTIONS] [DIRECTORY]
```

### Options

- `-v`: Enable verbose mode to print extraction progress.

### Arguments

- `DIRECTORY`: (Optional) The directory where `.tar.gz` files are located. If not provided, it will use `/path/to/your/directory` as the default directory.

## Logging

The script logs all extraction activities to a log file located at `/home/pi/untar.log`.

## Example

Extract files from a directory with verbose mode enabled:

```bash
./untarme.sh -v /path/to/your/directory
```

## Notes

- The script uses `tar` to extract files and attempts to strip the first 3 components of the file path.
- If a file extraction fails, it will be logged as such.
- The script exits with an error message if the specified directory does not exist.

Please make sure you have the necessary permissions to execute this script and access the specified directory.

## License

This script is provided under the [MIT License](LICENSE). Feel free to use and modify it as needed.

## Donations

If you want to show your appreciation, you can donate via [PayPal](https://www.paypal.com/donate?hosted_button_id=ULMMXE4DLQVZS) . Thanks!