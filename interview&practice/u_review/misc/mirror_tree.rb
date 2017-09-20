=begin
check to find if a binary tree is balanced
=end
class Node

  attr_accessor :left, :right

  def initialize
    @left = nil
    @right = nil
  end

  def add_children(left,right)
    @left = left
    @right = right
  end

end

def mirror_tree(root)
  return true if root.right.nil? && root.left.nil?
  return false if root.right.nil? || root.left.nil?

  queue = [[root.left,root.right]]

  until queue.empty?
    node1,node2 = queue.shift
    return false if node2.right && node1.left.nil?
    return false if node2.left && node1.right.nil?
    if node1.left
      return false if node2.right.nil?
      queue.push([node1.left,node2.right])
    end
    if node1.right
      return false if node2.left.nil?
      queue.push([node1.right,node2.left])
    end
  end
  true
end


a = Node.new
b = Node.new
c = Node.new
a.add_children(b,c)
d = Node.new
e = Node.new
b.add_children(d,e)
f = Node.new
g = Node.new
c.add_children(f,g)
h = Node.new
e.add_children(nil,h)
i = Node.new
f.add_children(i,nil)

puts mirror_tree(a)
