class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /[\n,]/
    if numbers.start_with?('//')
      custom_delimiter, numbers = parse_custom_delimiter(numbers)
      delimiter = Regexp.new(custom_delimiter)
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select(&:negative?)

    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end

  private

  def parse_custom_delimiter(input)
    match = input.match(%r{//(.+)\n(.*)})
    [Regexp.escape(match[1]), match[2]]
  end
end
  