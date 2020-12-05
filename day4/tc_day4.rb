require_relative "day4"
require "test/unit"

class TestDay4 < Test::Unit::TestCase
  def test_example_1
    result = PassportValidator.validate("day4/example.txt")
    assert_equal(2, result)
  end

  def test_input_1
    result = PassportValidator.validate("day4/input.txt")
    assert_equal(254, result)
  end

  def test_byr
    assert(PassportValidator.byr_valid?("2000"))
    assert(!PassportValidator.byr_valid?("1900"))
    assert(!PassportValidator.byr_valid?("2100"))
  end

  def test_hgt
    assert(PassportValidator.hgt_valid?("160cm"))
    assert(PassportValidator.hgt_valid?("60in"))
    assert(!PassportValidator.hgt_valid?("16cm"))
    assert(!PassportValidator.hgt_valid?("6in"))
    assert(!PassportValidator.hgt_valid?("190"))
  end

  def test_hcl
    assert(PassportValidator.hcl_valid?("#123abc"))
    assert(!PassportValidator.hcl_valid?("123abc"))
    assert(!PassportValidator.hcl_valid?("#23abc"))
    assert(!PassportValidator.hcl_valid?("#1234abcd"))
    assert(!PassportValidator.hcl_valid?("#123abz"))
  end
end
