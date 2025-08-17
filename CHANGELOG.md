# Changelog

All notable changes to the Columnizer project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2024-12-17

### Added
- Comprehensive help system with `--help` and `-h` options
- Version information with `--version` and `-v` options
- Robust error handling for missing files and invalid options
- Support for empty line handling
- Comprehensive test suite with 13 test cases
- Makefile for build automation
- Proper project structure with documentation
- `.gitignore` file for better repository management

### Changed
- Improved code structure with better function documentation
- Enhanced variable handling and array operations
- Better stdin support (though still requires `/dev/stdin` path)
- More reliable column width calculation
- Improved spacing algorithm for better alignment

### Fixed
- Fixed array handling for lines with different numbers of columns
- Improved error messages and exit codes
- Better handling of edge cases (empty files, single columns)
- Fixed potential issues with special characters in field names

### Security
- Added input validation for file paths
- Improved error handling to prevent script crashes

## [0.1.0] - 2014-08-28

### Added
- Initial version by Chauncey Yan
- Basic column formatting functionality
- Tab-stop alignment (8-character spacing)
- Support for whitespace-separated data
