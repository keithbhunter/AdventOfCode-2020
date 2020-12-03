class Graph
  def initialize(file)
    lines = File.read(file).split("\n")
    @columns = lines.map { |line| line.split("") }
  end

  def value_at(row, col)
    row_data = @columns[row]
    if row_data.nil? 
      return nil
    end
    
    wrapped_column = col % row_data.length
    row_data[wrapped_column]
  end

  def values_along_slope(start_row, start_col, slope_x, slope_y)
    values = Array.new
    row = start_row
    col = start_col
    
    until value_at(row, col).nil? do
      values << value_at(row, col)
      row += slope_y
      col += slope_x
    end
    
    values
  end
end
