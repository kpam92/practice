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



def reverse_subset(head, x, y)
  curr_node = head
  next_node_up = head.next_node

  until next_node_up.val = x
    curr_node = next_node_up
    next_node_up = curr_node.next_node
  end

  beginning_node = curr_node # holds the node right before the subset

  first_node = next_node_up
  middle_node = next_node_up.next_node

  # if statement below catches edge case of having only two nodes next to each other.
  if middle_node.val == y
    first_node.next_node = middle_node.next_node
    middle_node.next_node = first_node
    beginning_node.next_node = middle_node
    return list_values(head)
  end

  third_node = middle_node.next_node

  #this loop will run until first node is the last one
  until first_node.val == y
    middle_node.next_node = first_node
    first_node = middle_node
    middle_node = third_node
    third_node = third_node.next_node
  end

  # this assigns the node right before the subset to have the last
  # of the subset as its next node
  curr_node.next_node = first_node

  # this assigns the first of the subset, which is now the last, to
  # have the node right after the subset as its next node
  next_node_up.next_node = middle_node

  return list_values(head)

end

def list_values(head)
  until head.nil?
    puts head.val
    head = head.next_node
  end
end


# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')
# f = Node.new('f')
# a.next_node = b
# b.next_node = c
# c.next_node = d
# d.next_node = e
# e.next_node = f


# Find if a node list is cyclical : check IC/23.rb
