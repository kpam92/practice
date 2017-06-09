# 8.1 Considering two singly linked lists in which each node holds
# a number, assuming that both are sorted, create a function to
# merge the two lists into on linked list.

# Node class

class Node

  attr_accessor :val, :next_node

  def initialize(val,next_node = nil)
    @val = val
    @next_node = next_node
  end

end

def merge_lists(list_x, list_y)

  if list_x.val > list_y.val
    result_list = list_y
    list_y = list_y.next_node
    result_list.next_node = nil
  else
    result_list = list_x
    list_x = list_x.next_node
    result_list.next_node = nil
  end

  current_node = result_list
  until list_x.nil? || list_y.nil?
    if list_y.val > list_x.val
      current_node.next_node = list_x
      list_x = list_x.next_node
    else
      current_node.next_node = list_y
      list_y = list_y.next_node
    end
    current_node = current_node.next_node
  end

  if list_x.nil?
    current_node.next_node = list_y
  else
    current_node.next_node = list_x
  end
  result_list
end

# How it works:
# This function iterates over the first node in each list, comparing
# them to each other, and reassigning the next node for each so that
# it turns in to one list. Iterating once, the time complexity is
# O(n) (really O(m+n)), and space complexity is O(1) because nodes
# are just reassigned, and nothing new is created in terms of space.


# 8.2 Given a singly linked-list, an argument of value x, and value y, find
# the subset of the linked list and reverse all elements from x to y in the
# linked list

def reverse_subset(head, x, y)
end
