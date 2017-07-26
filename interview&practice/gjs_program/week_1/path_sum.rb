# Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
#
# For example:
# Given the below binary tree and sum = 22,
#               5
#              / \
#             4   8
#            /   / \
#           11  13  4
#          /  \    / \
#         7    2  5   1
# return
# [
#    [5,4,11,2],
#    [5,8,4,5]
# ]



class Node

  attr_accessor :value, :right, :left

  def initialize(value)
    @value = value
    @right = nil
    @left = nil

  end
end

a = Node.new(5)
b = Node.new(4)
c = Node.new(8)
a.left = b
a.right = c
d = Node.new(11)
b.right = d
e = Node.new(13)
f = Node.new(4)
c.left = e
c.right = f
g = Node.new(7)
h = Node.new(2)
d.left = g
d.right = h
i = Node.new(5)
j = Node.new(1)
f.left = i
f.right = j

def sum_paths(root, sum)
  paths = sum_helper(root)

  paths.select {|x| x.reduce(:+) == sum}
end

def sum_helper(root)
  return [[root.value]] if root.left.nil? && root.right.nil?

  result = []
  if root.right
    curr_right = sum_helper(root.right)
    curr_right = curr_right.map { |x| x = x.unshift(root.value) }
    result.concat(curr_right)
  end

  if root.left
    curr_left = sum_helper(root.left)
    curr_left = curr_left.map { |x| x = x.unshift(root.value) }
    result.concat(curr_left)
  end

  result
end

# How it works
# This solution works in a DFS manner, collecting all paths, then selecting
# those that sum to the target. The time complexity is O(n) where n is the amount
# of nodes, and the space is O(n), where n is the amount of different paths


# print sum_helper(a)
# puts sum_helper(a)
# print sum_paths(a, 22)
# print sum_paths(a, 18)
