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

class Node
  attr_accessor :left, :right, :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

end

def b_tree(array,parent = nil)
  return nil if array.empty?
  middle = array.length/2
  left = array[0...middle]
  right = array[middle+1..-1]
  root = Node.new(array[middle])
  root.parent = parent
  root.left = b_tree(left,root)
  root.right = b_tree(right,root)
  root
end

lala = b_tree([1,2,3,4,5,6,7,8])

def bst_checker(root)
  bst_helper(root,-Float::INFINITY,Float::INFINITY)
end


def bst_helper(node,low,high)

  return false if node.value < low || node.value > high
  return true if node.right.nil? && node.left.nil?

  if node.left
    curr_left = bst_helper(node.left,low,node.value)
    return false unless curr_left
  end

  if node.right
    curr_right = bst_helper(node.right,node.value,high)
    return false unless curr_right
  end

  true
end
# # lala.right.value = 100
#
# p bst_checker(lala)

def balanced_tree?(root)
  balance_checker(root)[0]
end

def balance_checker(node)
  return [true,0] if node.nil?
  return [true,1] if node.left.nil? && node.right.nil?

  left = balance_checker(node.left)
  return [false,nil] if left[0] == false
  right = balance_checker(node.right)
  return [false,nil] if right[0] == false

  return [false,nil] if (left[1] - right[1]).abs > 1
  return [true,[left[1],right[1]].max+1]
end
# a = Node.new(3)
# b = Node.new(2)
# c = Node.new(1)
# a.left = b
# b.left = c
# d = Node.new(4)
# a.right = d
# p balanced_tree?(a)

# class G_Node
#
#   attr_accessor :children, :parent, :value
#
#   def initialize(value)
#     @value = value
#     @children = []
#   end
#
#   def add_child(child)
#     child.parent = self
#     @children.push(child)
#   end
# end

# def builder(projects,dependencies)
#   projects_hash = {}
#
#   projects.each {|x| projects_hash[x] = G_Node.new(x)}
#
#   dependencies.each do |parent,child|
#     projects_hash[parent].add_child(projects_hash[child])
#   end
#
#   proj_queue = []
#   projects_hash.values.each {|x| proj_queue.push(x) if x.parent.nil?}
#   result = []
#
#   while proj_queue.length > 0
#     curr_proj = proj_queue.shift
#     result.push(curr_proj.value)
#     until curr_proj.children.empty?
#       proj_queue.push(curr_proj.children.pop)
#     end
#   end
#
#   # return 'can\'t do it bud' if result.length != projects
#   result
# end
# dependencies = [
#   ['f','c'],
#   ['f','b'],
#   ['b','a'],
#   ['f','a'],
#   ['d','c'],
# ]
# p builder(%w(a b c d e f),dependencies)

def first_common_ancestor(node1,node2)
  depth_1 = 0
  curr = node1
  while curr
    depth_1 += 1
    curr = curr.parent
  end

  depth_2 = 0
  curr = node2
  while curr
    depth_2 += 1
    curr = curr.parent
  end

  if depth_1 > depth_2
    until depth_1 == depth_2
      depth_1 -= 1
      node1 = node1.parent
    end
  elsif depth_1 < depth_2
    until depth_2 == depth_1
      depth_2 -= 1
      node2 = node2.parent
    end
  end

  until node1.nil? || node2.nil?
    return node1.value if node1 == node2
    node1 = node1.parent
    node2 = node2.parent
  end

  'no matching parent'
end

curr_tree = b_tree([1,2,3,4,5,6,7,8,9,10])
a = curr_tree.left.right
b = curr_tree.right.left
p curr_tree
p first_common_ancestor(a,b)
