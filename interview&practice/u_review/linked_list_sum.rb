# Write a function that returns the sum of a linked list set

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def self.chain(array)
    idx = 0
    while idx < array.length - 1
      array[idx].next = array[idx + 1]

      idx += 1
    end
  end
end

def linked_sum(node)
  sum = 0

  until node.next.nil?
    sum += node.value
    node = node.next
  end

  sum
end
