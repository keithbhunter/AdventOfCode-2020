require_relative "day5"
require "test/unit"

class TestDay5 < Test::Unit::TestCase
  def test_row
    pass = BoardingPass.new("FBFBBFFRLR")
    assert_equal(44, pass.row)
  end

  def test_col
    pass = BoardingPass.new("FBFBBFFRLR")
    assert_equal(5, pass.col)
  end

  def test_seat_id
    pass = BoardingPass.new("FBFBBFFRLR")
    assert_equal(357, pass.seat_id)
  end

  def test_input_1
    passes = File.read("day5/input.txt").split("\n")
    seat_ids = passes.map { |pass| 
      BoardingPass.new(pass).seat_id 
    }

    diff = (12..871).to_a - seat_ids
    puts diff

    assert_equal(871, seat_ids.max)
  end
end
