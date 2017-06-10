# 10.1 Write a program that takes as input the root
# of a binary tree and checks whether the tree is height balanced.
# This means that the difference in the height of its left and right
# subtrees is at most 1.
require 'byebug'

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


# def balanced_tree?(root)
#
#   #basecase of if there is no child
#   return 0 if root.nil?
#   #basecase of if this node has no children
#   return 1 if @right.nil? && @left.nil? && !@parent.nil?
#
#   #this is a recursive call down the tree
#   left = balanced_tree?(@left)
#   right = balanced_tree?(@right)
#
#   #this will return a false if somewhere down the line there
#   #was an unbalance in subtrees
#   return false if (left == false || right == false)
#   # left ||= 0
#   # right ||= 0
#
#   #if both left and right calls returned a number, then
#   #this code will check that it only has, at most, a difference
#   #of 1
#   byebug;
#   difference = (left - right).abs
#   if difference == 1 || difference == 0
#     byebug;
#     return true if @parent.nil?
#     return [left,right].max + 1
#   else
#     return false
#   end
#
# end

def is_balanced_binary_tree(root)

  def check_balance(tree)
    return [true, -1] if tree.nil?

    left_result = check_balance(tree.left)
    return [false, 0] unless left_result[0]
    right_result = check_balance(tree.right)
    return [false, 0] unless right_result[0]

    is_balanced = (left_result[1] - right_result[1]).abs <= 1
    height = [left_result[1],right_result[1]].max + 1
    return [is_balanced, height]
  end

  return check_balance(root)[0]
end

# How this works:
# The program starts with the root node, then recursively calls the
# helper function 'check_balance' to determine whether the entire tree
# is balanced. The helper function gets called until it reaches the end
# of the tree, with base cases for nil nodes. When the stack goes back down,
# each height of the left and right side of each node are calculated, and
# both the height and boolean of all balanced expressions are returned. The
# final return is checking the boolean of whether the entire tree is balanced.
# This entails O(n) time and space, where n is the number of total nodes.

# root = BSTNode.new(0)
# root.left = BSTNode.new(1,root)
# root.left.right = BSTNode.new(1,root)
# root.right = BSTNode.new(2,root)
# root.right.right = BSTNode.new(2,root)
# root.right.right.right = BSTNode.new(2,root)
# is_balanced_binary_tree(root)


# Create a method that returns an array of arrays where each array is the
# collection of values of each depth in order from left to right

def depth_displayer(head)
  depth_array([head])
end

def depth_array(array)
  return [] if array.empty?
  next_array = []
  result = []

  array.each do |node|
    result << node.value
    next_array << node.left if node.left
    next_array << node.right if node.right
  end

  return [result].concat(depth_array(next_array))
end


# How it works:
#
# This method utilizes a recursive call, first creating an array of nodes
# in the queue, while throwing the left and right nodes of each one into
# a new queue to be called on the stack until there are no elements left.
# The time complexity is O(n), where n is the number of nodes in the tree
# as we iterate through each one once.

# root = BSTNode.new(5)
# root.left = BSTNode.new(2,root)
# root.left.right = BSTNode.new(3,root)
# root.right = BSTNode.new(7,root)
# root.right.right = BSTNode.new(8,root)
# root.right.right.right = BSTNode.new(9,root)
#
# print depth_displayer(root)
