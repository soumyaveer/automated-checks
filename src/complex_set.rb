# Stores an unordered list of unique elements
class ComplexSet
  include Enumerable

  def add(item)
    @items.push(item) unless @items.include?(item)
  end

  def initialize(items = [])
    @items = items
  end

  def each
    @items.each { |item| yield item }
  end

  def union(another_set)
    result = ComplexSet.new

    @items.each { |item| result.add(item) }

    another_set.each do |item|
      result.add(item)
    end

    result
  end

  def ==(other)
    other_includes_all_item_from_self = other.each do |other_item|
      self.include?(other_item)
    end

    self_includes_all_items_from_other = self.each do |my_item|
      other.include?(my_item)
    end

    other_includes_all_item_from_self && self_includes_all_items_from_other
  end
end