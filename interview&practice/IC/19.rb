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
    @values.pop
  end

end


def Queue

  def initialize
    @en = Stack.new
    @de = Stack.new
  end

  def push(x)
    @en.push(x)
  end

  def pop
    raise 'empty queue' if @de.empty? && @de.empty?
    if @de.empty?
      until @en.empty?
        @de.push(@en.pop)
      end
    end
    @de.pop
  end

end
