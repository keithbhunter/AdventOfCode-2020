require_relative "day4"
require "test/unit"

class TestDay4 < Test::Unit::TestCase
  def test_example_1
    result = PassportValidator.validate("day4/example.txt")
    assert_equal(2, result)
  end

  def test_input_1
    result = PassportValidator.validate("day4/input.txt")
    assert_equal(254, result)
  end
end
