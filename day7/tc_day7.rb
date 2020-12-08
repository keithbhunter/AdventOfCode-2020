require_relative "day7"
require "test/unit"

class TestDay7 < Test::Unit::TestCase
  def test_example_1
    rules = Rules.new("day7/example.txt")
    contains = rules.rules_containing("shiny gold")
    assert_equal(4, contains.length)
  end

  def test_input_1
    rules = Rules.new("day7/input.txt")
    contains = rules.rules_containing("shiny gold")
    assert_equal(0, contains.length)
  end
end