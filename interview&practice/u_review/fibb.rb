=begin
Write a function fib() that a takes an integer nn and returns the nnth fibonacci ↴ number.
Let's say our fibonacci series is 0-indexed and starts with 0. So:

  fib(0) # => 0
fib(1) # => 1
fib(2) # => 1
fib(3) # => 2
fib(4) # => 3
...
=end

def fibb(n)
  return 0 if n == 0
  return 1 if n == 1 || n == 2

  x = 1
  y = 1
  z = 2

  count = 3
  while count < n
    x,y = y,z
    z = x + y
    count += 1
  end

  z

end
