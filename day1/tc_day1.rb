require_relative "day1"
require "test/unit"

class TestDay1 < Test::Unit::TestCase
  def test_example_part_1
    array = [1721, 979, 366, 299, 675, 1456]
    assert_equal(514579, findTwoSum2020AndMultiply(array))
  end

  def test_input_part_1
    array = File.read("day1/input.txt").split.map(&:to_i)
    assert_equal(712075, findTwoSum2020AndMultiply(array))
  end

  def test_example_part_2
    array = [1721, 979, 366, 299, 675, 1456]
    assert_equal(241861950, findThreeSum2020AndMultiply(array))
  end

  def test_input_part_2
    array = File.read("day1/input.txt").split.map(&:to_i)
    assert_equal(145245270, findThreeSum2020AndMultiply(array))
  end
end
