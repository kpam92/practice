# 10.1 Write a program that takes as input the root
# of a binary tree and checks whether the tree is height balanced.
# This means that the difference in the height of its left and right
# subtrees is at most 1.

class BSTNode
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
