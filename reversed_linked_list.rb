
#this linked list class only keeps track of the next node in line, only going one way
class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

#given only the head of a linked list, create a method that reverses the list
# and takes 0(1) space, and 0(N) time
def reverse_linked_list(head_node)
  prev_node = nil

  until node == nil

    next_node = node.next_node

    node.next = prev_node

    prev_node = node

    node = next_node

  end

  prev_node

end
