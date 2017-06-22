# You have a linked list ↴ and want to find the kkth to last node.
# Write a function kth_to_last_node() that takes an integer kk and the head_node of a singly linked list, and returns the kkth to last node in the list.


class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def k_to_last(k, node)

  length = 0

  current = node

  while current
    length += 1
    current = current.next
  end

  length_to_k = length - k

  current = node

  length_to_k.times { current = current.next}

  current
end


# how it works

# We traverse through the entire list, finding out the length,
# then we calculate which node to traverse to, then we reach that node.
# This takes O(1) space, and O(n)time, where n is the length of the list.

# a = LinkedListNode.new(1)
# b = LinkedListNode.new(2)
# c = LinkedListNode.new(3)
# d = LinkedListNode.new(4)
# e = LinkedListNode.new(5)
# f = LinkedListNode.new(6)
# g = LinkedListNode.new(7)
# h = LinkedListNode.new(8)
# i = LinkedListNode.new(9)
# j = LinkedListNode.new(10)
#
# a.next = b
# b.next = c
# c.next = d
# d.next = e
# e.next = f
# f.next = g
# g.next = h
# h.next = i
# i.next = j
#
# puts k_to_last(2,a)
