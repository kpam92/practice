def fibb(n)
  memo = Hash.new {|h,k| h[k] = 0 }
  fib_helper(n,memo)
end

def fib_helper(n,memo)
  return 0 if n == 0 || n == 1

  if memo[n] == 0
    memo[n] = fib_helper(n-1,memo) + fib_helper(n-2,memo)
  end
  memo[n]
end

def triple_step(n)
  steps = Array.new(n+1) {0}

  steps.each_with_index do |step,idx|
    next if idx == 0
    steps[idx] += 1 if idx == 1
    steps[idx] += 1 if idx == 2
    steps[idx] += 1 if idx == 3

    if steps[(idx - 1)] && idx - 1 >= 0
      steps[idx] += steps[idx - 1]
    end
    if steps[(idx - 2)] && idx - 2 >= 0
      p idx
      steps[idx] += steps[idx - 2]
    end
    if steps[(idx - 3)] && idx - 3 >= 0
      steps[idx] += steps[idx - 3]
    end
    p steps
  end
  # p steps
  steps[-1]
end


def make_change(amount,denominations)
  ways = Array.new(amount+1) {0}
  ways[0] = 1

  denominations.each do |coin|
    (coin..amount).each do |higher_amount|
      remainder = higher_amount - coin
      ways[higher_amount] += ways[remainder]
    end
  end
  ways[-1]
end

# puts make_change(7,[5,3])

def magic_index(array)
  head = 0
  tail = array.length - 1

  while head <= tail
    # p "head:#{head}tail:#{tail}"
    middle = head + ((tail - head)/2)

    if array[middle] == middle
      return middle
    elsif array[middle] > middle
      tail = middle - 1
    else # array[middle] < middle
      head = middle + 1
    end
  end

  return -1
end

# p magic_index([]) == -1
# p magic_index([0]) == 0
# p magic_index([1]) == -1
# p magic_index([0,2,3,4,5,6,7,8]) == -1
# p magic_index([-12,-9,-6,0,1,3,4,7])
# p magic_index([0,1,2,3,4,5,6]) == 3
# p magic_index([-40,-20,-1,1,2,3,5,7,9,12,13])

matrix = [
  [0,0,0,0,0,0],
  [0,1,0,1,0,1],
  [1,0,0,1,0,0],
  [0,1,0,1,1,1],
  [0,1,0,0,0,0]
]
def robot_step(matrix)
  robot_stepper(matrix,0,0)[1]
end

def robot_stepper(matrix,row,column)
  matrix[row][column] = 1
  if row == matrix.length - 1 && column == matrix[row].length - 1
    return [true,[]]
  end

  if column < matrix[row].length - 1 && matrix[row][column + 1] == 0
    right_option = robot_stepper(matrix,row,column + 1)
    if right_option[0]
      return [true,['R'] + right_option[1]]
    end
  end

  if row < matrix.length - 1 && matrix[row + 1][column] == 0
    left_option = robot_stepper(matrix,row + 1,column)
    if left_option[0]
      return [true,['D'] + left_option[1]]
    end
  end

  return [false,[]]
end

def coins(n)
  ways = Array.new(n+1) {0}

  ways[0] += 1

  [1,5,10,25].each do |coin|
    (coin..n).each do |higher_amount|
      remainder = higher_amount - coin
      ways[higher_amount] += ways[remainder]
    end
  end

  ways[-1]
end

def subsets(array)
  return [[]] if array.length == 0

  curr_item = array.shift
  result = []
  next_subsets = subsets(array)
  next_subsets.each {|x| result.push(x)}

  next_subsets.each do |set|
    result.push([curr_item] + set)
  end

  return result
end

p subsets(%w(a b c d e f))
