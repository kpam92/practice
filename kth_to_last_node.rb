class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def kth_to_last_node(int, node)
  list = []

  until node == nil
      list << node
      node = node.next
  end

  list[(-int)]
end
