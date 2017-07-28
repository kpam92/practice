# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

class Node

  attr_accessor :value, :left, :right

  def constructor(value)
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
