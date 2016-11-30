class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end


def reverse_linked_list(head_node)
  prev_node = nil

  until node == nil

    next_node = node.next_node

    node.next = prev_node

    prev_node = node

    node = next_node
  end

end
