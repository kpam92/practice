# implement a stack with push, pop, and min, which gives the smallest
# element in the stack. all should be O(n)

class Stack

attr_accessor :min

def initialize()
  @min = nil
end
