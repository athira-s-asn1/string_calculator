# string_calculator

This project is an implementation of a String Calculator using Ruby with Test-Driven Development (TDD) practices.

## Task Overview

The goal is to implement a `StringCalculator` class with the following functionality:
- Add numbers from a string input.
- Handle custom delimiters.
- Ignore numbers greater than 1000.
- Raise errors for negative numbers, listing all negatives in the exception.

## Features

1. Returns 0 for an empty string.
2. Handles newlines as delimiters.
3. Supports custom delimiters.
4. Throws an error for negative numbers.
5. Ignores numbers greater than 1000.
6. Handles multiple custom delimiters.

## Requirements

- **Ruby**: Ensure Ruby is installed on your system.
- **RSpec**: Used for writing and running tests.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/athira-s-asn1/string_calculator.git
2. Navigate to the project directory:
   cd string_calculator
3. Install the required gems:
   bundle install

## Usage

To run the StringCalculator:
    ```bash
    ruby string_calculator.rb


## Running Tests

To execute the test suite:
    ```bash
    rspec

## Example Input and Output

    | Input                 | Output           |
    |-----------------------|------------------|
    | `""`                  | `0`              |
    | `"1,2,3"`             | `6`              |
    | `"1\n2,3"`            | `6`              |
    | `"//;\n1;2;3"`        | `6`              |
    | `"2,1001"`            | `2`              |
    | `"//[*][%]\n1*2%3"`   | `6`              |
    | `"1,-2,3,-4"`         | Error: `negative numbers not allowed: -2, -4` |


## Project Link : https://github.com/athira-s-asn1/string_calculator.git