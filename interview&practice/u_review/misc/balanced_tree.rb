=begin
check to find if a binary tree is balanced
=end
class Node

  attr_accessor :left, :rightmost

  def initialize
    @left = nil
    @right = nil
  end

  def add_children(left,right)
    @left = left
    @right = right
  end

end

def balanced_tree(root)
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

puts balanced_tree(a)
