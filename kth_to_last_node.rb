class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def kth_to_last_node_1(int, node)
  list = []

  until node == nil
      list << node
      node = node.next
  end

  list[-int]
end

def kth_to_last_node_2(int, node)

  left_node = node
  right_node = node

  space = 1
  until space == int
    right_node = right_node.next
    space += 1
  end

  until right_node == nil
      right_node = right_node.next
      left_node = left_node.next
  end
  
  return nil if space < int
  left_node
end
