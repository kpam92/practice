# Write a function to find the 2nd largest element in a binary search tree.

class BinaryTreeNode

  attr_accessor :value, :left, :right

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

  if head.right.nil?
    return go_left(head.left)
  end

  parent = nil
  until head.right.nil?
    parent = head
    head = head.right
  end
  parent.value
end

def go_left(head)
  until head.right.nil?
    head = head.right
  end
  head.value
end

# How it works:
# Because this is a binary search tree with all nodes on the right being
# larger than those on the left, the second largest element will always be
# the parent of the right most node. So, we traverse down the right of the
# tree, and return the parent of the rightmost element. This take O(1) space,
# and O(n) time, where n is the height of the tree.


a = BinaryTreeNode.new(3)
b = BinaryTreeNode.new(1)
# c = BinaryTreeNode.new(5)
# d = BinaryTreeNode.new(0)
e = BinaryTreeNode.new(2)
# f = BinaryTreeNode.new(4)
# g = BinaryTreeNode.new(6)
#
a.left = b
# a.right = c
# b.left = d
b.right = e
# c.left = f
# c.right = g
#
puts second_largest(a)
