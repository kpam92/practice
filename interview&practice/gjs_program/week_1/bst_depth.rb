# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

class Node

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @right = right
    @left = left
  end

end

def max_depth(node)

  return 0 if node.nil?
  return 1 if node.right.nil? && node.left.nil?

  curr_depth = [max_depth(node.left), max_depth(node.right)].max

  1 + curr_depth
end

# How it works
#
# This solution is a DFS method that treks to the farthest node, and recursively
# returns depth. We check every single node, so the space is O(1), and time complexity
# is O(n), where n is the number of nodes.


#               5
#              / \
#             4   8
#            /   / \
#           11  13  4
#          /  \    / \
#         7    2  5   1


# a = Node.new(5)
# b = Node.new(4)
# c = Node.new(8)
# a.left = b
# a.right = c
# d = Node.new(11)
# b.right = d
# e = Node.new(13)
# f = Node.new(4)
# c.left = e
# c.right = f
# g = Node.new(7)
# h = Node.new(2)
# d.left = g
# d.right = h
# i = Node.new(5)
# j = Node.new(1)
# f.left = i
# f.right = j
# j.right = Node.new(10)
# j.right.right = Node.new(1)

# puts max_depth(a)
