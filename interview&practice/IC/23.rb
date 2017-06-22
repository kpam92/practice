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

def linked_cycle?(node)

  slow_iterator = node
  fast_iterator = node

  until fast_iterator.nil? && slow_iterator.nil?
    slow_iterator = slow_iterator.next
    fast_iterator = fast_iterator.next.next

    return true if slow_iterator == fast_iterator
    
  end
  false
end
