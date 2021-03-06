require_relative "day8"
require "test/unit"

class TestDay8 < Test::Unit::TestCase
  def test_example_1
    boot = BootCode.new("day8/example.txt")
    acc = boot.acc_before_repeat_instruction
    assert_equal(5, acc)
  end

  def test_input_1
    boot = BootCode.new("day8/input.txt")
    acc = boot.acc_before_repeat_instruction
    assert_equal(1671, acc)
  end

  def test_example_2
    boot = BootCode.new("day8/example.txt")
    acc = boot.fix
    assert_equal(8, acc)
  end

  def test_input_2
    boot = BootCode.new("day8/input.txt")
    acc = boot.fix
    assert_equal(892, acc)
  end
end