# Implement a queue with 2 stacks. Your queue should have an enqueue
# and a dequeue function and it should be "first in first out" (FIFO).


class Stack
  attr_reader :values

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
  attr_accessor :on, :off

  def initialize
    @on = Stack.new
    @off = Stack.new
  end

  def push(x)
    @on.push(x)
  end

  def pop
    raise 'empty queue' if @off.values.empty? && @off.values.empty?
    if @off.values.empty?
      until @on.empty?
        @off.push(@on.pop)
      end
    end
    @off.pop
  end

end

# How it works:
# everything is straightforward, except for pop in the Queue. When pop is
# called, if there are no values in the second stack, then every value in
# the first stack is popped into the second one, then the first item on this
# stack is then popped off. Every pop call after will cause another pop.
