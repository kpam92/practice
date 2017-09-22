class Node
  attr_accessor :visited, :children
  def initialize(value = nil)
    @value = value
    @visited = false
    @children = []
  end
end

a = Node.new
b = Node.new
c = Node.new
d = Node.new
e = Node.new
f = Node.new
a.children.push(b,e,f)
b.children.push(e,d)
c.children.push(b)
d.children.push(c,e)
g = Node.new

def route?(node1,node2)
  return true if checker(node2,node1)
  return true if checker(node1,node2)
  false

end

def checker(node1,node2)
  curr_node = node1
  while curr_node && !curr_node.visited
    curr_node.visited = true
    curr_node.children.each do |child|
      return true if child == node2
      return true if route?(child,node2)
    end
  end

  false
end
# 
# p route?(f,a)
# p route?(a,f)
