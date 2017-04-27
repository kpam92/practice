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
end
