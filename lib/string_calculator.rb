class StringCalculator
  DEFAULT_DELIMITER = /[\n,]/

  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    nums = parse_numbers(numbers, delimiter)

    validate_negatives(nums)
    filter_large_numbers(nums).sum
  end

  private

  def extract_delimiter_and_numbers(numbers)
    if numbers.start_with?('//')
      parse_custom_delimiter(numbers)
    else
      [DEFAULT_DELIMITER, numbers]
    end
  end

  def parse_numbers(numbers, delimiter)
    numbers.split(delimiter).map(&:to_i)
  end

  def validate_negatives(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end

  def filter_large_numbers(nums)
    nums.reject { |n| n > 1000 }
  end

  def parse_custom_delimiter(input)
    if input.start_with?("//[")
      match = input.match(%r{//\[(.+?)\]\n(.*)})
      delimiters = match[1].split('][').map { |delim| Regexp.escape(delim) }.join('|')
      [Regexp.new(delimiters), match[2]]
    else
      match = input.match(%r{//(.)\n(.*)})
      [Regexp.new(Regexp.escape(match[1])), match[2]]
    end
  end
end