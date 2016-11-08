# implement a stack with push, pop, and min, which gives the smallest
# element in the stack. all should be O(n)

class Stack

  attr_accessor :min

  def initialize()
    @values = []
  end

  def push(val)
    if @values.empty?
      @values.push([val,val])
    else
      min = @values.last[1] < val ? @values.last[1] : val
      @values.push([val,min])
    end
  end

  def pop
    @values.pop
  end

  def min
    @values.last[1]
  end
end
