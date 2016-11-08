# implement a stack with push, pop, and min, which gives the smallest
# element in the stack. all should be O(n)

class Stack

  attr_accessor :min

  def initialize()
    @min = nil
    @values = []
  end

  def push(val)
    @values.push(val)
    @min = val if (val < @min) || @min.nil?
  end

  def pop
    
  end

end
