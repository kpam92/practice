# The car manufacturer Honda holds their distribution system in the form of a tree (not necessarily binary). The root is the company itself, and every node in the tree represents a car distributor that receives cars from the parent node and ships them to its children nodes. The leaf nodes are car dealerships that sell cars direct to consumers. In addition, every node holds an integer that is the cost of shipping a car to it.
#
# Take for example the tree below:
#
# alt
#
# A path from Honda’s factory to a car dealership, which is a path from the root to a leaf in the tree, is called a Sales Path. The cost of a Sales Path is the sum of the costs for every node in the path. For example, in the tree above one Sales Path is 0→3→0→10, and its cost is 13 (0+3+0+10).
#
# Honda wishes to find the minimal Sales Path cost in its distribution tree. Given a node rootNode, write an function getCheapestCost that calculates the minimal Sales Path cost in the tree.
#
# Implement your function in the most efficient manner and analyze its time and space complexities.
#
# For example:
#
# Given the rootNode of the tree in diagram above
#
# Your function would return:
#
# 7 since it’s the minimal Sales Path cost (there are actually two Sales Paths in the tree whose cost is 7: 0→6→1 and 0→3→2→1→1)
#
# Constraints:
#
# [time limit] 5000ms
#
# [input] Node rootNode
#
# 0 ≤ rootNode.cost ≤ 100000
# [output] integer


class Node

 attr_accessor :value, :children

 def initialize(value)
   @value = value
   @children = []
 end

  def add_children(nodes)
    @children.concat(nodes)
  end

end

def get_cheapest_cost(node)
  return node.value if node.children.empty?

  lowest = nil

  node.children.each do |child|
    curr_result = get_cheapest_cost(child)
    lowest = curr_result if lowest.nil? || curr_result < lowest
  end

  node.value + lowest
end


# How it works:

# This solution uses a recursive approach to find the cheapest distribution
# chain. This occurs by finding the cheapest path of the children, and returning
# that value plus the parent node's value. This take O(n) space and time, where n
# is the amount of nodes in the tree.


# a = Node.new(0)
# b = Node.new(5)
# c = Node.new(3)
# d = Node.new(6)
# e = Node.new(4)
# f = Node.new(2)
# g = Node.new(0)
# h = Node.new(1)
# i = Node.new(5)
# j = Node.new(1)
# k = Node.new(10)
# l = Node.new(1)
#
# a.add_children([b,c,d])
# b.add_children([e])
# c.add_children([f,g])
# d.add_children([h,i])
# f.add_children([j])
# g.add_children([k])
# j.add_children([l])
#
#
# puts get_cheapest_cost(a)
