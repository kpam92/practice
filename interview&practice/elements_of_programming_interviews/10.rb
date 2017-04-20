# 10.1 Write a program that takes as input the root
# of a binary tree and checks whether the tree is height balanced.
# This means that the difference in the height of its left and right
# subtrees is at most 1.

class BSTNode
  attr_accessor :left, :right, :parent
  attr_reader :data

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end
end


def balanced_tree?(root)

  #basecase of if there is no child
  return 0 if root.nil?
  #basecase of if this node has no children
  return 1 if @right.nil? && @left.nil? && !@parent.nil?

  #this is a recursive call down the tree
  left = balanced_tree?(@left)
  right = balanced_tree?(@right)

  #this will return a false if somewhere down the line there
  #was an unbalance in subtrees
  return false if (left == false || right == false)

  #if both left and right calls returned a number, then
  #this code will check that it only has, at most, a difference
  #of 1

  difference = (left - right).abs
  if difference == 1 || difference == 0
    return [left,right].max + 1
  else
    return false
  end

end
