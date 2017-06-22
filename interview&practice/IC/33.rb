# I have an array of n + 1n+1 numbers. Every number in the range 1...n1...n appears once except for one number that appears twice.
# Write a function for finding the number that appears twice.


def find_duplicate(array)
  initial_sum = (array[0]..array[-1]).reduce(:+)

  array_sum = array.reduce(:+)

  array_sum - initial_sum
end

# how it works

# Because there is only one duplicate within the array of sorted integers,
# we find the sum of the range from the first integer to the last, and compare
# that to the sum of the array to find the one duplicate. This is O(1) space,
# with O(n) time, where n is the length of the array, because we have to iterate
# through the integers once in order to find the sum.
