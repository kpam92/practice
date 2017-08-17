# Write a function, fibs(num) which returns the first n elements from the fibonnacci sequence, given n.
#
# Solve it both iteratively and recursively.

def fibs_it(n)
end

def fibs_rec(n)
  return [0] if n == 1
  return [0,1] if n == 2

  last_fib = fibs_rec(n - 1)

  last_fib.push(last_fib[-2] + last_fib[-1])
end