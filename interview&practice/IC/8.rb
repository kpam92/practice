
# Write a function to see if a binary tree ↴ is "superbalanced" (a new tree property we just made up).
# A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.

class BinaryTreeNode

  attr_accessor :value, :left, :right
  # attr_reader :left, :right

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
  return [0,true] if node.nil?
  return [1,true] if node.left.nil? && node.right.nil?

  right = balanced(node.right)
  left = balanced(node.left)

  if left[1] == false || right[1] == false || (left[0] - right[0]).abs > 1
    return [-1,false]
  else
    return [[left[0],right[0]].max + 1,true]
  end

end

#how it works:
# this recursive solution works through a binary tree, finding the depth
# of each node. It returns the depth once it reaches the last node, and the
# parent node then compares each node's depth, making sure the difference
# is no greater than 1, and returns up. If any depth is more than one, it
# returns false, and trickles up. This solution is O(n) space and time, where
# n is the amount of nodes in the tree, because we iterate through each one.


# a = BinaryTreeNode.new(2)
# b = BinaryTreeNode.new(1)
# c = BinaryTreeNode.new(3)
# d = BinaryTreeNode.new(4)
# e = BinaryTreeNode.new(5)
# a.left = b
# a.right = c
# b.right = e
# e.right = d
#
# puts balanced_tree(a)
