class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /[\n,]/
    
    # Check for custom delimiter
    if numbers.start_with?('//')
      custom_delimiter, numbers = parse_custom_delimiter(numbers)
      delimiter = Regexp.new(custom_delimiter)
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select(&:negative?)

    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    # Ignore numbers greater than 1000
    nums.reject { |n| n > 1000 }.sum
  end

  private

  def parse_custom_delimiter(input)
    # Check for multiple delimiters inside square brackets (e.g., //[*][%]\n1*2%3)
    if input.start_with?("//[")
      match = input.match(%r{//\[(.+?)\]\n(.*)}) # Match multiple delimiters
      delimiters = match[1].split('][').map { |delim| Regexp.escape(delim) }.join('|') # Create a regex for all delimiters
      [delimiters, match[2]]
    else
      match = input.match(%r{//(.)\n(.*)})
      [Regexp.escape(match[1]), match[2]]
    end
  end
end
