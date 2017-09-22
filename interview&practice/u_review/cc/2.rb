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
a.create_children([2,5,9,1,4,4,7])

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

  return 'doesn\'t exist' if k > count
  trek = count - k + 1
  curr = head
  count = 1

  until count == trek
    count += 1
    curr = curr.next
  end

  curr.value

end

# p k_to_last(a,90)

def partition(head,x)
  head_lower = nil
  lower = nil

  head_higher = nil
  higher = nil

  curr = head
  while curr
    if curr.value >= x
      if head_lower.nil?
        head_lower = curr
        curr = curr.next
        head_lower.next = nil
        lower = head_lower

      else
        lower.next = curr
        curr = curr.next
        lower = lower.next
      end
      lower.next = nil
    else #curr.value < x
      if head_higher.nil?
        head_higher = curr
        curr = curr.next
        head_higher.next = nil
        higher = head_higher
      else
        higher.next = curr
        curr = curr.next
        higher = higher.next
      end
    end
  end

  higher.next = head_lower
  head_higher
end

# p partition(a,6)

def sum_lists(head1,head2)
  result_head = nil
  result = nil
  remainder = 0

  while head1 || head2
    curr_sum = 0
    sum1 = head1.nil? ? 0 : head1.value
    sum2 = head2.nil? ? 0 : head2.value
    curr_sum = sum1 + sum2 + remainder
    new_digit = curr_sum % 10
    remainder = curr_sum / 10
    if result_head.nil?
      result_head = Node.new(new_digit)
      result = result_head
    else
      result.next = Node.new(new_digit)
      result = result.next
    end

    head1 = head1.nil? ? nil : head1.next
    head2 = head2.nil? ? nil : head2.next

  end

  if remainder > 0
    result.next = Node.new(remainder)
  end

  result_head
end
# a = Node.new(9)
# a.create_children([])
# b = Node.new(1)
# # b.create_children([9,9])
# p  sum_lists(a,b)

def intersect_list(a,b)
  curr_a = a
  curr_b = b

  a_count = 1
  until curr_a.next.nil?
    a_count += 1
    curr_a = curr_a.next
  end

  b_count = 1
  until curr_b.next.nil?
    b_count += 1
    curr_b = curr_b.next
  end

  return 'no intersect' unless curr_a == curr_b

  curr_a = a
  curr_b = b

  if a_count > b_count
    (a_count - b_count).times { curr_a = curr_a.next}
  elsif b_count > a_count
    (b_count - a_count).times { curr_b = curr_b.next}
  end

  while true
    return curr_a if curr_a == curr_b
    curr_a = curr_a.next
    curr_b = curr_b.next
  end

end
# a = Node.new(3)
# a.create_children([1,5,9])
# b = Node.new(4)
# b.create_children([6,7,9,10,11])
# c = Node.new(7)
# c.create_children([2,1])
# a.next.next.next.next = c
# b.next.next.next.next.next.next = c
#
# p intersect_list(a,b)
