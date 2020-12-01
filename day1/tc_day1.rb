require_relative "day1"
require "test/unit"

class TestDay1 < Test::Unit::TestCase
  def test_example
    array = [1721, 979, 366, 299, 675, 1456]
    assert_equal(514579, findSum2020AndMultiply(array))
  end

  def test_input
    array = File.read("day1/input.txt").split.map(&:to_i)
    assert_equal(712075, findSum2020AndMultiply(array))
  end
end
