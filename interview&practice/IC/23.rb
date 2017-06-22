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

  while fast_iterator != nil && fast_iterator.next != nil

    slow_iterator = slow_iterator.next
    fast_iterator = fast_iterator.next.next

    return true if slow_iterator == fast_iterator
  end
  false
end

# 
# a = LinkedListNode.new(1)
# b = LinkedListNode.new(2)
# c = LinkedListNode.new(3)
# d = LinkedListNode.new(4)
# e = LinkedListNode.new(5)
# f = LinkedListNode.new(6)
#
# a.next = b
# b.next = c
# c.next = d
# d.next = e
# e.next = f
# f.next = a
#
# puts linked_cycle?(a)
#
# g = LinkedListNode.new(1)
# h = LinkedListNode.new(1)
# i = LinkedListNode.new(1)
# j = LinkedListNode.new(1)
#
# g.next = h
# h.next = i
# i.next = j
#
# puts linked_cycle?(g)
