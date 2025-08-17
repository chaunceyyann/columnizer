#!/bin/bash
######################################################################################################
# Test Suite for Columnizer
# Purpose: Comprehensive testing of the columnizer functionality
######################################################################################################

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Test function
run_test() {
    local test_name="$1"
    local expected="$2"
    local command="$3"

    echo -n "Testing: $test_name... "
    TESTS_RUN=$((TESTS_RUN + 1))

    local actual
    actual=$(eval "$command" 2>&1)
    local exit_code=$?

    if [[ "$actual" == "$expected" && $exit_code -eq 0 ]]; then
        echo -e "${GREEN}PASS${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}FAIL${NC}"
        echo "  Expected: '$expected'"
        echo "  Actual:   '$actual'"
        echo "  Exit code: $exit_code"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
}

# Test function for exit codes
run_test_exit_code() {
    local test_name="$1"
    local expected_exit_code="$2"
    local command="$3"

    echo -n "Testing: $test_name... "
    TESTS_RUN=$((TESTS_RUN + 1))

    eval "$command" >/dev/null 2>&1
    local actual_exit_code=$?

    if [[ $actual_exit_code -eq $expected_exit_code ]]; then
        echo -e "${GREEN}PASS${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}FAIL${NC}"
        echo "  Expected exit code: $expected_exit_code"
        echo "  Actual exit code:   $actual_exit_code"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
}

echo "========================================"
echo "Columnizer Test Suite"
echo "========================================"

# Setup test data
echo -e "name age city\nJohn 25 NewYork\nJane 30 LosAngeles\nBob 35 Chicago" > test_basic.txt
echo -e "product price category\nLaptop 999.99 Electronics\nBook 29.99 Education\nPhone 599.50 Electronics" > test_decimal.txt
echo -e "a\nb c\nd e f" > test_uneven.txt
echo "" > test_empty.txt

# Make sure the script is executable
chmod +x ./formater

echo
echo "Basic Functionality Tests:"
echo "-------------------------"

# Test basic formatting
expected="name    age     city
John    25      NewYork
Jane    30      LosAngeles
Bob     35      Chicago"
run_test "Basic column formatting" "$expected" "cd . && ./formater test_basic.txt"

# Test decimal numbers
expected="product price   category
Laptop  999.99  Electronics
Book    29.99   Education
Phone   599.50  Electronics"
run_test "Decimal number formatting" "$expected" "cd . && ./formater test_decimal.txt"

# Test uneven columns
expected="a
b       c
d       e       f"
run_test "Uneven column handling" "$expected" "cd . && ./formater test_uneven.txt"

echo
echo "Command Line Interface Tests:"
echo "----------------------------"

# Test help option
run_test_exit_code "Help option exits successfully" 0 "cd . && ./formater --help"
run_test_exit_code "Short help option exits successfully" 0 "cd . && ./formater -h"

# Test version option
run_test_exit_code "Version option exits successfully" 0 "cd . && ./formater --version"
run_test_exit_code "Short version option exits successfully" 0 "cd . && ./formater -v"

echo
echo "Error Handling Tests:"
echo "--------------------"

# Test no arguments
run_test_exit_code "No arguments should fail" 1 "cd . && ./formater"

# Test non-existent file
run_test_exit_code "Non-existent file should fail" 1 "cd . && ./formater nonexistent.txt"

# Test invalid option
run_test_exit_code "Invalid option should fail" 1 "cd . && ./formater --invalid"

# Test empty file
run_test_exit_code "Empty file should fail" 1 "cd . && ./formater test_empty.txt"

echo
echo "Advanced Tests:"
echo "--------------"

# Test single column
echo "singlecolumn" > test_single.txt
expected="singlecolumn"
run_test "Single column formatting" "$expected" "cd . && ./formater test_single.txt"

# Test very long fields
echo -e "short verylongfieldnamethatexceedstypicallengths normal\nfield2 short long" > test_long.txt
expected="short   verylongfieldnamethatexceedstypicallengths      normal
field2  short                                           long"
run_test "Long field handling" "$expected" "cd . && ./formater test_long.txt"

echo
echo "========================================"
echo "Test Results Summary:"
echo "========================================"
echo "Tests run:    $TESTS_RUN"
echo -e "Tests passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests failed: ${RED}$TESTS_FAILED${NC}"

if [[ $TESTS_FAILED -eq 0 ]]; then
    echo -e "\n${GREEN}All tests passed!${NC}"
    exit 0
else
    echo -e "\n${RED}Some tests failed!${NC}"
    exit 1
fi

# Cleanup
rm -f test_basic.txt test_decimal.txt test_uneven.txt test_empty.txt test_single.txt test_long.txt
