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
    result_list.next_node = nil
    list_y = list_y.next
  else
    result_list = list_x
    result_list.next_node = nil
    list_x = list_x.next
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


  end

end
