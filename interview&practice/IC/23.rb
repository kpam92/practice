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


a = LinkedListNode(1)
b = LinkedListNode(2)
c = LinkedListNode(3)
d = LinkedListNode(4)
e = LinkedListNode(5)
f = LinkedListNode(6)

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = a

puts linked_cycle?(a)

g = LinkedListNode(1)
h = LinkedListNode(1)
i = LinkedListNode(1)
j = LinkedListNode(1)

g.next = h
h.next = i
i.next = j

puts linked_cycle?(g)
