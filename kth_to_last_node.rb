class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def kth_to_last_node(int, node)

  left_node = node
  right_node = node
  space = 0
  until right_node == nil
      right_node = right_node.next
      space += 1
      left_node = left_node.next if space >= k
  end

  left_node
end
