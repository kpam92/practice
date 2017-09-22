class Stack
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def push(x)
    @stack.push(x)
  end

  def pop
    @stack.pop
  end

  def empty?
    @stack.empty?
  end

  def peek
    @stack[-1]
  end
end


def stack_sorter(stack)
  temp_stack = Stack.new

  until stack.empty?
    temp_stack.push(stack.pop) if temp_stack.empty?
    if stack.peek <= temp_stack.peek
      temp_stack.push(stack.pop)
    else # stack.peek > temp_stack.peek
      num = stack.pop
      count = 0
      until temp_stack.peek > num || temp_stack.empty?
        stack.push(temp_stack.pop)
        count += 1
      end
      temp_stack.push(num)
      count.times { temp_stack.push(stack.pop)}
    end
  end
  temp_stack.stack
end
# a = Stack.new
# a.push(3)
# a.push(2)
# a.push(1)
# a.push(8)
# a.push(10)
# a.push(81)
# p stack_sorter(a)
