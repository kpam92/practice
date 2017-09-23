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

puts triple_step(5)
