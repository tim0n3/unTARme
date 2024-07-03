# Tarball Extractor

This project provides scripts to efficiently extract multiple `.tar.gz` files in parallel on a Raspberry Pi 4B (or similar devices). The scripts are designed to leverage either GNU Parallel or Bash background jobs to fully utilize multiple CPU cores, improving performance.

## Branches

- `bash-bg`: Contains the script using Bash background jobs for parallel extraction.
- `gnu-parallel`: Contains the script using GNU Parallel for parallel extraction.

## Prerequisites

- Raspberry Pi 4B (or similar device) with Raspbian or a similar Linux distribution installed.
- Bash shell (default on most Linux distributions).
- Tar utility (usually pre-installed).

## Installation

### For `gnu-parallel` branch

1. Install GNU Parallel:
   ```bash
   sudo apt-get update
   sudo apt-get install parallel
   ```

2. Clone the repository and checkout the `gnu-parallel` branch:
   ```bash
   git clone https://github.com/tim0n3/unTARme.git
   cd unTARme
   git checkout gnu-parallel
   ```

### For `bash-bg` branch

1. Clone the repository and checkout the `bash-bg` branch:
   ```bash
   git clone https://github.com/tim0n3/unTARme.git
   cd unTARme
   git checkout bash-bg
   ```

## Usage

### General Instructions

1. Ensure your `.tar.gz` files are in a directory. By default, the script looks for files in `/path/to/your/directory`. You can specify a different directory as an argument.
2. Make the script executable:
   ```bash
   chmod +x ./*.sh
   ```

### Running the script

#### For `gnu-parallel` script or branch

```bash
./gnu-parallel-untarme.sh -v /path/to/your/directory
```

#### For `bash-bg` script or branch

```bash
./bg-untarme.sh -v /path/to/your/directory
```

### Options

- `-v`: Enable verbose mode to print detailed logs to the console.

### Example

To extract files from `/home/pi/tarballs` with verbose mode enabled:

```bash
./untarme.sh -v /home/pi/tarballs
```

## Script Details

### GNU Parallel Script (`feat-parrallel-gnu-parallel` branch)

The script uses GNU Parallel to handle concurrent extraction of `.tar.gz` files. It ensures efficient CPU and I/O utilization, providing better performance for a large number of files.

### Bash Background Jobs Script (`feat-parrallel-bash-native` branch)

The script uses Bash background jobs to handle concurrent extraction. It limits the number of concurrent jobs to avoid overloading the system, providing a simple yet effective method for parallel extraction.

## Logging

The script logs all operations to `/home/pi/untar.log`. If verbose mode is enabled, it also prints detailed logs to the console.

## Contributing

Feel free to submit issues and pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Donations

If you want to show your appreciation, you can donate via [PayPal](https://www.paypal.com/donate?hosted_button_id=ULMMXE4DLQVZS) . Thanks!

```
