
# 9.1 Design a stack that has a max operation, in addition to
# push and pop. The max method should return the maximum value
# stored in the stack.

class Stack

  def initialize
    @values = []
  end

  def push(val)
    @values.push([val,val]) if @values.empty?
    last_max = @values[-1][1]
    curr_max = val > last_max ? val : last_max
    @values.push([val,curr_max])
  end

  def pop
    @values.pop
  end

  def max
    return nil if @values.empty?
    @values[-1][1]
  end
end
