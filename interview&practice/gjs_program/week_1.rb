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
