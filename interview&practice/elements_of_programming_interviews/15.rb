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
  return [true, nil] if node.nil?
  return [true, node.value] if node.left.nil? && node.right.nil?

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
valid_bst?(a)

# How it works:
# The function recursively goes down the tree, returning if it is called
# on a nil child, or if it is called on a node with no children. When
# the stack tracks back up, we make sure that each child is either smaller
# or larger (or equal to) the parent node, and also checking the boolean to
# make sure that all previous comparisons were successful. We return the final
# result when parent is nil. This is O(h) time, h being the height.


# book solution

def is_bst?(tree)
  return in_bst_range(tree, -999999999, 999999999)
end

def in_bst_range(tree, min, max)
  return true unless tree
  return false if tree.value < min || tree.value > max
  return in_bst_range(tree.left, min, tree.value) && in_bst_range(tree.right, tree.value, max)
end

# How it works:
#
# This solution has the same idea, but is more optimized and succinct in
# how it compares for validation. The tree starts with a range of large
# numbers, and traveling down the right or left, the max or min then changes
# to the next node value. The result then bubbles up and returns. Basecases
# are to return true if the argument is nil, and false if the argument goes
# outside of the min max scope. This is O(h) time complexity as well.
