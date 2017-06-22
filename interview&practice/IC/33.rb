# I have an array of n + 1n+1 numbers. Every number in the range 1...n1...n appears once except for one number that appears twice.
# Write a function for finding the number that appears twice.


def find_duplicate(array)
  initial_sum = (array[0]..array[1]).reduce(:+)

  array_sum = array.reduce(:+)

  array_sum - initial_sum
end

# how it works
