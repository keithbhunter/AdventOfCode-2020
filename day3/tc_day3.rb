require_relative "graph"
require "test/unit"

class TestDay23 < Test::Unit::TestCase
  def test_graph_value_at
    graph = Graph.new("day3/example.txt")
    assert_equal(".", graph.value_at(0, 0))
    assert_equal("#", graph.value_at(1, 0))
  end

  def test_graph_value_at_column_out_of_bounds
    graph = Graph.new("day3/example.txt")
    assert_equal(".", graph.value_at(0, 11))
    assert_equal("#", graph.value_at(0, 13))
  end

  def test_graph_value_at_row_out_of_bounds
    graph = Graph.new("day3/example.txt")
    assert_nil(graph.value_at(12, 0))
  end

  def test_example_1
    graph = Graph.new("day3/example.txt")
    values = graph.values_along_slope(0, 0, 3, 1)
    trees = values.select { |char| char == "#" }
    assert_equal(7, number_of_trees(graph, 3, 1))
  end

  def test_input_1
    graph = Graph.new("day3/input.txt")
    values = graph.values_along_slope(0, 0, 3, 1)
    trees = values.select { |char| char == "#" }
    assert_equal(184, number_of_trees(graph, 3, 1))
  end

  def test_example_2
    graph = Graph.new("day3/example.txt")
    slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    result = slopes.reduce(1) { |memo, slope|
      memo * number_of_trees(graph, slope[0], slope[1])
    }
    assert_equal(336, result)
  end

  def test_input_2
    graph = Graph.new("day3/input.txt")
    slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    result = slopes.reduce(1) { |memo, slope|
      memo * number_of_trees(graph, slope[0], slope[1]) 
    }
    assert_equal(2431272960, result)
  end

  def number_of_trees(graph, slope_x, slope_y)
    values = graph.values_along_slope(0, 0, slope_x, slope_y)
    trees = values.select { |char| char == "#" }
    trees.length
  end
end
