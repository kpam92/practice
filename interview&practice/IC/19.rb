# Implement a queue with 2 stacks. Your queue should have an enqueue
# and a dequeue function and it should be "first in first out" (FIFO).


class Stack

  def initialize
    @values = []
  end

  def push(x)
    @values.push(x)
  end

  def pop
    @values.pop(x)
  end

end
