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
    assert_equal(7, trees.length)
  end

  def test_input_1
    graph = Graph.new("day3/input.txt")
    values = graph.values_along_slope(0, 0, 3, 1)
    trees = values.select { |char| char == "#" }
    assert_equal(184, trees.length)
  end
end
