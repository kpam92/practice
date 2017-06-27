
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


def balanced_tree(node)
  balanced(node)[1]
end

def balanced(node)
  return [1,true] if node.left.nil? && node.right.nil?

  right = balanced(node.right)
  left = balanced(node.left)

  if left[1] == false || right[1] == false || (left[0] - right[0]).abs > 1
    return [-1,false]
  else
    return [[left[0],right[0]].max + 1,true]
  end

end

a = BinaryTreeNode.new(2)
b = BinaryTreeNode.new(1)
c = BinaryTreeNode.new(3)
a.left = b
a.right = c

puts balanced_tree(a)
