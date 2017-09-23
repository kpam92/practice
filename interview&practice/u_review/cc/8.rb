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
