# Columnizer

A bash shell script that formats tabular data into neatly aligned columns.

## Features

- **Automatic column alignment**: Analyzes input data and formats it into aligned columns
- **Tab-stop spacing**: Uses 8-character tab stops for consistent formatting
- **Flexible input**: Works with any whitespace-separated data
- **Lightweight**: Pure bash implementation with no external dependencies

## Installation

```bash
git clone https://github.com/your-username/columnizer.git
cd columnizer
chmod +x formater
```

## Usage

```bash
./formater input_file.txt
```

### Example

Input file (`data.txt`):
```
name age city
John 25 NewYork
Jane 30 LosAngeles
Bob 35 Chicago
```

Output:
```bash
$ ./formater data.txt
name    age     city
John    25      NewYork
Jane    30      LosAngeles
Bob     35      Chicago
```

## How it works

1. **Analysis phase**: Scans the input file to determine the maximum width needed for each column
2. **Formatting phase**: Outputs each row with proper spacing using calculated column widths
3. **Tab-stop alignment**: Rounds column widths to the nearest multiple of 8 for consistent tab-stop spacing

## Requirements

- Bash shell
- Standard Unix utilities (built-in commands only)

## Development

### Testing

Run the comprehensive test suite:
```bash
make test
```

Or run tests directly:
```bash
./test_columnizer.sh
```

### Demo

See a quick demonstration:
```bash
make demo
```

### Build Targets

- `make test` - Run the test suite
- `make demo` - Show a demonstration
- `make install` - Install to `~/.local/bin/` (or `PREFIX=/path make install`)
- `make clean` - Clean up temporary files
- `make help` - Show available targets

## Version History

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

## Contributing

Feel free to submit issues and pull requests to improve the functionality.

### Ideas for Future Enhancements

- Custom field separators (CSV, TSV support)
- Different alignment options (left, right, center)
- Custom output formats (JSON, HTML table)
- Header row highlighting
- Numeric column sorting
- Configuration file support
