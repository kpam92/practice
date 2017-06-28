# Write a function to find the 2nd largest element in a binary search tree.

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
      @value = value
      @left  = nil
      @right = nil
  end

  def insert_left(value)
      @left = BinaryTreeNode.new(value)
      return @left
  end

  def insert_right(value)
      @right = BinaryTreeNode.new(value)
      return @right
  end
end

def second_largest(head)
end
