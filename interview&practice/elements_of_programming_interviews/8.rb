# 8.1 Considering two singly linked lists in which each node holds
# a number, assuming that both are sorted, create a function to
# merge the two lists into on linked list.

# Node class

class Node

  attr_accessor :val, :next_node

  def initialize(val,next_node = nil)
    @val = val
    @next_node = next_node
  end

end

def merge_lists(list_x, list_y)
end
