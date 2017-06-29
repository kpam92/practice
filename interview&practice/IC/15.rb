# Write a function fib() that a takes an integer n and returns the nth fibonacci ↴ number.

def fib(number)
  return 0 if number == 0
  return 1 if number == 1

  return (fib(number - 1) + fib(number - 2))

end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
