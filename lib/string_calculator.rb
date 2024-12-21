class StringCalculator
  # Method to add numbers from a string
  def add(numbers)
    # If the input string is empty, return 0 (base case)
    return 0 if numbers.empty?

    # Set the default delimiter to comma or newline
    delimiter = /[\n,]/

    # If the input string starts with "//", it means there's a custom delimiter
    if numbers.start_with?('//')
      # Parse the custom delimiter and the numbers part
      custom_delimiter, numbers = parse_custom_delimiter(numbers)
      # Update the delimiter to the custom one
      delimiter = Regexp.new(custom_delimiter)
    end

    # Split the string by the delimiter and convert each part to an integer
    nums = numbers.split(delimiter).map(&:to_i)
    
    # Find negative numbers in the list
    negatives = nums.select(&:negative?)

    # If there are negative numbers, raise an error with the list of negatives
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    # Return the sum of the numbers
    nums.sum
  end

  private

  # Helper method to extract and return the custom delimiter and the numbers part
  def parse_custom_delimiter(input)
    # Match the format of "//<delimiter>\n<numbers>"
    match = input.match(%r{//(.+)\n(.*)})
    # Return the escaped custom delimiter and the numbers part
    [Regexp.escape(match[1]), match[2]]
  end
end