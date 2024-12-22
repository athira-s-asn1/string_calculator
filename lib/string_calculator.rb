class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    nums = parse_numbers(numbers, delimiter)

    handle_negatives(nums)
    nums.sum
  end

  private

  def extract_delimiter(numbers)
    if numbers.start_with?('//')
      custom_delimiter, rest = parse_custom_delimiter(numbers)
      [Regexp.new(custom_delimiter), rest]
    else
      [/[\n,]/, numbers]
    end
  end

  def parse_custom_delimiter(input)
    match = input.match(%r{//(.+)\n(.*)})
    [Regexp.escape(match[1]), match[2]]
  end

  def parse_numbers(numbers, delimiter)
    numbers.split(delimiter)
           .map(&:to_i)
           .reject { |n| n > 1000 } # Ignore numbers > 1000
  end

  def handle_negatives(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
