class BoardingPass
  def initialize(pass)
    row_str = pass[0..6]
    col_str = pass[7..9]

    rows_lower_bounds = 0
    rows_upper_bounds = 127

    row_str.split("").each_with_index { |char, index| 
      range = (rows_upper_bounds - rows_lower_bounds) + 1
      offset = range / 2

      if char == "F"
        rows_upper_bounds -= offset
      else
        rows_lower_bounds += offset
      end

      next unless index == row_str.length - 1
      @row = rows_lower_bounds
    }

    cols_lower_bounds = 0
    cols_upper_bounds = 7

    col_str.split("").each_with_index { |char, index| 
      range = (cols_upper_bounds - cols_lower_bounds) + 1
      offset = range / 2

      if char == "L"
        cols_upper_bounds -= offset
      else
        cols_lower_bounds += offset
      end

      next unless index == col_str.length - 1
      @col = cols_lower_bounds
    }
  end

  def row
    @row
  end

  def col
    @col
  end

  def seat_id
    @row * 8 + @col
  end
end