# Write a function to check that a binary tree ↴ is a valid binary search tree


class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

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
  node_valid?(head)[1]
end

def node_valid?(node)
  return [nil,true] if node.nil?
  return [node.value,true] if node.right.nil? && node.left.nil?

  left = node_valid?(node.left)
  right = node_valid?(node.right)

  return [nil,false] if left[1] == false || right[1] == false

  if (left.nil?|| left[0] < node.value) && (right.nil?|| right[0] > node.value)
    return [node.value, true]
  else
    return [nil,false]
  end
end

a  = BinaryTreeNode.new(2)
a.insert_left(1)
a.insert_left(3)

puts valid_search_tree(a)
