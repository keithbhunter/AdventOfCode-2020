require_relative "day6"
require "test/unit"

class TestDay6 < Test::Unit::TestCase
  def test_num_of_yes_in_form
    groups = File.read("day6/example.txt").split("\n\n")
    num = CustomsForms.num_of_yes_in_form(groups.first)
    assert_equal(3, num)
  end

  def test_num_of_yes
    groups = File.read("day6/example.txt").split("\n\n")
    num = CustomsForms.num_of_yes(groups)
    assert_equal(11, num)
  end

  def test_num_of_yes
    groups = File.read("day6/input.txt").split("\n\n")
    num = CustomsForms.num_of_yes(groups)
    assert_equal(6382, num)
  end
end