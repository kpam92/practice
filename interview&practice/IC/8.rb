
# Write a function to see if a binary tree ↴ is "superbalanced" (a new tree property we just made up).
# A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.

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
