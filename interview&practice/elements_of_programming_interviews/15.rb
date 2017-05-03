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
  return [false, nil] if [false,nil] if left_side[0] == false || right_side[0] == false

  answer = nil

  if (left_side[1] == nil || left_side[1] <= node.value)
      && (right_side[1] == nil || right_side[1] >= node.value)
    answer = [true, node.value]
  end

  node.parent.nil? ? answer[0] : answer
  
end
