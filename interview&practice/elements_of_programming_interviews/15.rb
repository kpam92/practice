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

  answer = [false,nil]

  if (left_side[1] == nil || left_side[1] <= node.value) && (right_side[1] == nil || right_side[1] >= node.value)
    answer = [true, node.value]
  end

  node.parent.nil? ? answer[0] : answer

end

a = BSTNode.new(2)
b = BSTNode.new(1,a)
c = BSTNode.new(3,a)
d = BSTNode.new(4,c)
a.left,a.right = b,c
c.right = d
