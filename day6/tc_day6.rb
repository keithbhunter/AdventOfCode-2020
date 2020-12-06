require_relative "day6"
require "test/unit"

class TestDay6 < Test::Unit::TestCase
  def test_num_of_yes_in_form
    groups = File.read("day6/example.txt").split("\n\n")
    num = CustomsForms.yes_in_form(groups.first).length
    assert_equal(3, num)
  end

  def test_num_of_yes_example
    groups = File.read("day6/example.txt").split("\n\n")
    num = CustomsForms.num_of_yes(groups)
    assert_equal(11, num)
  end

  def test_num_of_yes_input
    groups = File.read("day6/input.txt").split("\n\n")
    num = CustomsForms.num_of_yes(groups)
    assert_equal(6382, num)
  end

  def test_num_of_yes_from_everyone_example
    groups = File.read("day6/example.txt").split("\n\n")
    num = CustomsForms.num_of_yes_from_everyone(groups)
    assert_equal(6, num)
  end

  def test_num_of_yes_from_everyone_input
    groups = File.read("day6/input.txt").split("\n\n")
    num = CustomsForms.num_of_yes_from_everyone(groups)
    assert_equal(3197, num)
  end
end