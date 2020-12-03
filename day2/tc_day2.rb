require_relative "day2"
require "test/unit"

class TestDay2 < Test::Unit::TestCase
  def test_example_part_1
    array = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
    assert_equal(2, PasswordValidator.number_of_valid(array))
  end

  def test_input_part_1
    array = File.read("day2/input.txt").split("\n")
    assert_equal(0, PasswordValidator.number_of_valid(array))
  end
end