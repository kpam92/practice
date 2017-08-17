# Write a function, fibs(num) which returns the first n elements from the fibonnacci sequence, given n.
#
# Solve it both iteratively and recursively.

def fibs_it(n)
  return [] if n == 0
  return [0] if n == 1
  return [0,1] if n == 2

  result = [0,1]

  until result.length == n
    result.push((result[-2] + result[-1]))
  end

  result
end

def fibs_rec(n)
  return [] if n == 0
  return [0] if n == 1
  return [0,1] if n == 2

  last_fib = fibs_rec(n - 1)

  last_fib.push(last_fib[-2] + last_fib[-1])
end

# Write a JavaScript function that takes a string and returns true if it's a palindrome, false if it's not. Use JavaScript.
#
# This solution takes less time and memory than rebuilding the string backward and comparing the two.

def is_pal?(string)

  idx1 = 0
  idx2 = string.length - 1

  while idx1 < idx2
    return false if string[idx1] != string[idx2]

    idx1 += 1
    idx2 -= 1
  end

  true
end


# JavaScript solution

# function isPal(string) {
#   let idx1 = 0
#   let idx2 = 0
#
#   while (idx1 < idx2) {
#     if (string[idx1] != string[idx2]) {
#       return false
#     };
#
#     idx1 ++
#     idx2 ++
#   }
#
#   return true
# }
