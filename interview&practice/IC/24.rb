# Write a function for reversing a linked list ↴ . Do it in-place ↴ .
#
# Your function will have one input: the head of the list.
#
# Your function should return the new head of the list.

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end


def reverse_list(node)

  first_node = node
  second_node = node.next

  first_node.next = nil

  return first_node if second_node.nil?

  until second_node.nil?
  third_node = second_node.next

  second_node.next = first_node

  first_node = second_node
  second_node = third_node

  end

  first_node
end
