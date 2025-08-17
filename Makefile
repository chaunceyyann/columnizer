# Makefile for Columnizer
# Simple build automation for the columnizer project

.PHONY: test install clean help demo

# Default target
all: test

# Run the test suite
test:
	@echo "Running Columnizer test suite..."
	@chmod +x formater test_columnizer.sh
	@./test_columnizer.sh

# Install the script to a local bin directory (user can override PREFIX)
PREFIX ?= $(HOME)/.local
install:
	@echo "Installing columnizer to $(PREFIX)/bin/"
	@mkdir -p $(PREFIX)/bin
	@cp formater $(PREFIX)/bin/columnizer
	@chmod +x $(PREFIX)/bin/columnizer
	@echo "Installation complete. Make sure $(PREFIX)/bin is in your PATH."

# Clean up test files and temporary files
clean:
	@echo "Cleaning up temporary files..."
	@rm -f test_*.txt *.tmp *.bak

# Run a demonstration
demo:
	@echo "=== Columnizer Demo ==="
	@echo "Creating sample data..."
	@printf "Name Age City Country\nJohn 25 NewYork USA\nJane 30 LosAngeles USA\nBob 35 Toronto Canada\nAlice 28 London UK\n" > demo_data.txt
	@echo
	@echo "Original data:"
	@cat demo_data.txt
	@echo
	@echo "Formatted output:"
	@./formater demo_data.txt
	@rm -f demo_data.txt

# Show help
help:
	@echo "Columnizer Makefile"
	@echo "=================="
	@echo "Available targets:"
	@echo "  test     - Run the test suite"
	@echo "  install  - Install columnizer to $(PREFIX)/bin/ (default: ~/.local/bin/)"
	@echo "  clean    - Remove temporary and test files"
	@echo "  demo     - Show a demonstration of columnizer"
	@echo "  help     - Show this help message"
	@echo ""
	@echo "Environment variables:"
	@echo "  PREFIX   - Installation prefix (default: ~/.local)"
	@echo ""
	@echo "Examples:"
	@echo "  make test                    # Run tests"
	@echo "  make install                 # Install to ~/.local/bin/"
	@echo "  PREFIX=/usr/local make install  # Install to /usr/local/bin/"
