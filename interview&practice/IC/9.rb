# Write a function to check that a binary tree ↴ is a valid binary search tree


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


def valid_search_tree(head)
  node_valid?(head)[2]
end

def node_valid?(node)
  return [nil, nil, true] if node.nil?
  return [node.value,node.value,true] if node.right.nil? && node.left.nil?

  left = node_valid?(node.left)
  right = node_valid?(node.right)

  return [nil,nil,false] if left[2] == false || right[2] == false

  curr_highest = [(left[1]||node.value - 1),(right[1]||node.value - 1),node.value].max
  curr_lowest = [(left[0]||node.value+ 1),(right[0]||node.value+ 1),node.value].min

  if (left.nil?|| node.left.value < node.value) && (right.nil?|| node.right.value > node.value) && (right[0] > node.value) && (right[1] > node.value) && (left[0] < node.value) && (left[1] < node.value)
    return [curr_lowest,curr_highest,true]
  else
    return [nil,nil,false]
  end
end


# How it works:
# This recursive solution does a DFS call, then trickles back up, making sure
# that each left node is less than the parent node, and that the right node is
# higher. This is O(n) space and time, where n is the amount of nodes.

a = BinaryTreeNode.new(3)
b = BinaryTreeNode.new(1)
c = BinaryTreeNode.new(5)
d = BinaryTreeNode.new(0)
e = BinaryTreeNode.new(2)
f = BinaryTreeNode.new(4)
g = BinaryTreeNode.new(6)

a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g

puts valid_search_tree(a)
