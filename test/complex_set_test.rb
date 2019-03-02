require "./src/complex_set"
require "test/unit"


class ComplexSetTest < Test::Unit::TestCase
  def test_calculates_union_correctly
    a = ComplexSet.new([1, 2, 3, 4])
    b = ComplexSet.new([2, 3, 4, 5])
    expected = ComplexSet.new([1, 2, 3, 4, 5])

    assert_equal(expected, a.union(b))
  end
end