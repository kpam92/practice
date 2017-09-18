=begin
You have a singly-linked list ↴ and want to check if it contains a cycle.
A singly-linked list is built with nodes, where each node has:

node.next—the next node in the list.
node.value—the data held in the node. For example, if our linked list stores people in line at the movies, node.value might be the person's name.
=end

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

def contains_cycle(head)
  slow = head
  fast = head
  while fast != nil && fast.next != nil
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end
  false
end
