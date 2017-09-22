class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

  def create_children(array)
    curr = self
    array.each {|x| curr.next = Node.new(x); curr = curr.next}
    self
  end
end

a = Node.new(1)
a.add_children([2,3,4,5,6,7,8,9])

def remove_dup(head)
  seen = {}
  prev = nil
  curr = head
  until curr.nil?
    if seen[curr.value]
      prev.next = curr_next
      curr = prev.next
    else
      seen[curr.value] = true
      prev = curr
      curr = curr.next
    end
  end

  head
end

def k_to_last(head,k)
  count = 0

  curr = head
  while curr
    count += 1
    curr = curr.next
  end
  count
end

p k_to_last(a,1)
