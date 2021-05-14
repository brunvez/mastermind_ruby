require 'minitest/autorun'

class ColorsValidatorTest < Minitest::Test
  def test_correct_colors_are_valid
    record = SecretCode.new(colors: %w[red blue cyan violet])
    validator = ColorsValidator.new

    validator.validate(record)

    assert_empty record.errors
  end

  def test_empty_array_is_invalid
    record = SecretCode.new(colors: [])
    validator = ColorsValidator.new

    validator.validate(record)

    assert_equal record.errors.messages, { colors: ['must all be present, be valid and not be repeated'] }
  end

  def test_empty_colors_are_invalid
    record = SecretCode.new(colors: ['red', 'blue', nil, ''])
    validator = ColorsValidator.new

    validator.validate(record)

    assert_equal record.errors.messages, { colors: ['must all be present, be valid and not be repeated'] }
  end

  def test_less_than_four_colors_are_invalid
    record = SecretCode.new(colors: %w[red blue yellow])
    validator = ColorsValidator.new

    validator.validate(record)

    assert_equal record.errors.messages, { colors: ['must all be present, be valid and not be repeated'] }
  end

  def test_more_than_four_colors_are_invalid
    record = SecretCode.new(colors: %w[red blue yellow violet cyan])
    validator = ColorsValidator.new

    validator.validate(record)

    assert_equal record.errors.messages, { colors: ['must all be present, be valid and not be repeated'] }
  end

  def test_repeated_colors_are_invalid
    record = SecretCode.new(colors: %w[red blue red violet])
    validator = ColorsValidator.new

    validator.validate(record)

    assert_equal record.errors.messages, { colors: ['must all be present, be valid and not be repeated'] }
  end
end
