require_relative "day10"
require "test/unit"

class TestDay10 < Test::Unit::TestCase
  def test_example_1
    diffs = chain_differences("day10/example.txt")
    assert_equal(7, diffs[1])
    assert_equal(5, diffs[3])
  end

  def test_example_2
    diffs = chain_differences("day10/example2.txt")
    assert_equal(22, diffs[1])
    assert_equal(10, diffs[3])
  end

  def test_input_1
    diffs = chain_differences("day10/input.txt")
    assert_equal(1690, diffs[1] * diffs[3])
  end
end