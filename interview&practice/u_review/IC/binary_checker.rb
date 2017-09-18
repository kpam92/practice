=begin
Write a function to check that a binary tree is a valid binary search tree.
=end

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

def valid_tree?(node)
  return true if node.left.nil? && node.right.nil?
  return checker(node)[2]
end

def checker(node)
  return [nil,nil,true] if node.nil?

  right = checker(node.right)
  left = checker(node.left)
  # return [node.value,node.value,true] if right.nil?

  return [nil,nil,false] if right[2] == false || left[2] == false
  curr_highest = [right[1]||node.value - 1,left[1]||node.value - 1,node.value].max
  curr_lowest = [right[0]||node.value + 1,left[0]||node.value + 1,node.value].min
  if (right[0].nil? || right[0] > node.value) && (left[1].nil? || left[1] < node.value )
    return [curr_lowest,curr_highest, true]
  else
     return [nil,nil,false]
  end

  return [node.value,true]

end

a = BinaryTreeNode.new(10)
a.insert_right(15)
a.insert_left(5)
a.right.insert_right(20)
a.right.insert_left(11)

puts valid_tree?(a)
