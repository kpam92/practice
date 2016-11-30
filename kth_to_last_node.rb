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

  (0...int - 1).each do |x|
      return nil if !right_node.next

      right_node = right_node.next
  end

  while right_node.next
      right_node = right_node.next
      left_node = left_node.next
  end

  left_node
end
