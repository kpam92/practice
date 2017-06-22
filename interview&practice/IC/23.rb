# A cycle occurs when a node’s @next points back to a previous node in the list. The linked list is no longer linear with a beginning and end—instead, it cycles through a loop of nodes.
#
# Write a function contains_cycle() that takes the first node in a singly-linked list and returns a boolean indicating whether the list contains a cycle.

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def linked_cycle?(list)
end
