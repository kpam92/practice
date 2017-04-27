# Given two nodes in a binary tree, design an algorithm that computes
# their Least Common Ancestor (LCA). Assume that each node has a parent pointer.

# brute force method
class BSTnode

  attr_accessor :left,:right,:parent,:child

  def initialize(left = nil, right = nil, parent = nil, child = nil)
    @left = left
    @right = right
    @child = child
    @parent = parent
  end

end

def lca_1(node1, node2)
  parents = {}

  until node1.parent.nil?
    parents[node1.parent] = true
    node1 = node1.parent
  end

  until node2.nil?
    return node2.parent if parents[node2.parent]
    node2 = node2.parent
  end

  nil
end

# how it works:
# this iterates through the first node's parents, and stores them in
# a hash. The second node then iterates up through its parents and
# returns the first node that is present in the hash. This takes up
# O(h) space and time, where h is the height.

# optimized solution
def depth(node)
  h = 0

  until node.nil?
    h += 1
    node = node.parent
  end
  h
end

def lca_2(node1, node2)

  depth1 = depth(node1)
  depth2 = depth(node2)

  # this switches the positions of the two nodes to make the
  # deeper node be node1
  node2, node1 = node1, node2 if depth(node2) > depth(node1)

  idx = (depth1 - depth2).abs
  while idx > 0
    node1 = node1.parent
    idx -= 1
  end

  until node1.nil?
    node1 = node1.parent
    node2 = node2.parent
    return node1 if node1 == node2
  end

  nil

end
