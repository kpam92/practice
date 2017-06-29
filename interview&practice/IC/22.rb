# Delete a node from a singly-linked list ↴ , given only a variable pointing to that node.

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def delete_node(head, node)
  prev = nil
  curr_node = head

  until curr_node == node
    prev = curr_node
    curr_node = curr_node.next
  end

  prev.next = curr_node.next

  head
end
