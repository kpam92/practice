# Write a function fib() that a takes an integer n and returns the nth fibonacci ↴ number.

def fib(number)
  return 0 if number == 0
  return 1 if number == 1

  return (fib(number - 1) + fib(number - 2))

end


def fib_no_rec(number)
  x = 0
  y = 1

  return x if number == 0
  return y if number == 1

  number -= 1

  while number > 0
    curr_num = x + y
    x = y
    y = curr_num
    number -= 1
  end

  curr_num
end


#how it works
# The firs solution is recursive and uses a call-stack. The first one has 
# O(logn) time complexity at the cost of space, where the second one iterates,
# having O(1) space and O(n) time, where n is the number. You would use either
# dependent on what you wish to sacrifice.

# puts fib(0)
# puts fib(1)
# puts fib(2)
# puts fib(3)
# puts fib(4)
#
# puts fib_no_rec(0)
# puts fib_no_rec(1)
# puts fib_no_rec(2)
# puts fib_no_rec(3)
# puts fib_no_rec(4)
