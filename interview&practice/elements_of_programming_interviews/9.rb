
# 9.1 Design a stack that has a max operation, in addition to
# push and pop. The max method should return the maximum value
# stored in the stack.

class Stack

  def initialize
    @values = []
  end

  def push(val)
    if @values.empty?
      @values.push([val,val])
    else
      last_max = @values[-1][1]
      curr_max = val > last_max ? val : last_max
      @values.push([val,curr_max])
    end
  end

  def pop
    @values.pop[0]
  end

  def max
    return nil if @values.empty?
    @values[-1][1]
  end
end


def is_balanced_binary_tree(root)

  def check_balance(tree)
    return [true, -1] if tree.nil?

    left_result = check_balance(root.left)
    return [false, 0] unless left_result[0]
    right_result = check_balance(root.right)
    return [false, 0] unless right_result[0]

    is_balanced = (left_result[1] - right_result[1]).abs <= 1
    height = [left_result[1],right_result[1]].max + 1
    return [is_balanced, height]
  end
end
