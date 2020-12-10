require_relative "day9"
require "test/unit"

class TestDay9 < Test::Unit::TestCase
  def test_example_1
    assert_equal(127, first_number_thingy("day9/example.txt", 5))
  end

  def test_input_1
    assert_equal(1309761972, first_number_thingy("day9/input.txt", 25))
  end

  def test_example_2
    result = contiguous_number_sum("day9/example.txt", 127)
    assert_equal(62, result.min + result.max)
  end

  def test_input_2
    result = contiguous_number_sum("day9/input.txt", 1309761972)
    assert_equal(177989832, result.min + result.max)
  end
end