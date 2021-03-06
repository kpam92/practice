# Use your Stack class to implement a new class MaxStack with a function get_max() that returns the largest element in the stack. get_max() should not remove the item.
#
# Your stacks will contain only integers.

class Stack

  # initialize an empty array
  def initialize
      @items = []
  end

  # push a new item to the last index
  def push(item)
      if @items.empty?
        @items.push([item,item])
        return nil
      else
        @items.push([item,[item,@items[-1][1]].max])
        return nil
      end
  end

  # remove the last item
  def pop()
      # if the stack is empty, return nil
      # (it would also be reasonable to throw an exception)
      if @items.empty?
          return nil
      end
      return @items.pop()
  end

  # see what the last item is
  def peek()
      if @items.empty?
          return nil
      end
      return @items[-1][0]
  end

  def get_max
    return nil if @items.empty?
    return @items[-1][1]
  end
end

#How it works:

# This stack class keeps track of the current max element. This occurs
# through coupling each element in the stack with the current max element
# when that value was added to the stack. This means that when we pop and push,
# we will still always have easy access to the max of the stack. This also allows
# us to keep having O(1) pushes,pops, and get_max.
