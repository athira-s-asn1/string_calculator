class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.strip.empty?

    numbers = handle_custom_delimiter(numbers)
    nums = convert_to_integers(numbers)
    negatives = find_negatives(nums)

    raise_error_for_negatives(negatives) if negatives.any?

    sum(nums)
  end

  private

  def handle_custom_delimiter(numbers)
    if numbers.start_with?('//')
      custom_delimiter, numbers = parse_custom_delimiter(numbers)
      numbers = numbers.split(Regexp.new(custom_delimiter)).join(',')
    end
    numbers
  end

  def convert_to_integers(numbers)
    numbers.split(/[\n,]/).map(&:to_i)
  end

  def find_negatives(nums)
    nums.select(&:negative?)
  end

  def raise_error_for_negatives(negatives)
    raise "negative numbers not allowed: #{negatives.join(', ')}"
  end

  def sum(nums)
    nums.reject { |n| n > 1000 }.sum
  end

  def parse_custom_delimiter(input)
    if input.start_with?("//[")
      match = input.match(%r{//\[(.+?)\]\n(.*)})
      delimiters = match[1].split('][').map { |delim| Regexp.escape(delim) }.join('|')
      [delimiters, match[2]]
    else
      match = input.match(%r{//(.)\n(.*)})
      [Regexp.escape(match[1]), match[2]]
    end
  end
end
