require_relative "day9"
require "test/unit"

class TestDay9 < Test::Unit::TestCase
  def test_example_1
    assert_equal(127, first_number_thingy("day9/example.txt", 5))
  end

  def test_input_1
    assert_equal(0, first_number_thingy("day9/input.txt", 25))
  end
end