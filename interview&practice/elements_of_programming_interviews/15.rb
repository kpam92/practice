# Write a program that take as input a binary
# tree and checks if the tree satisfies the
# BST property.

class BSTNode
  attr_accessor :left, :right, :parent, :value
  attr_reader :data

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end
end

def valid_bst?(node)
  return [true, node.value] if node.left.nil? && node.right.nil?
  return [true, nil] if node.nil?

  left_side = valid_bst?(node.left)
  right_side = valid_bst?(node.right)

  
end
